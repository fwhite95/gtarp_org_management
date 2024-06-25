import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:org_management/src/repositories/organization_repository.dart';
import 'package:org_management/src/repositories/weed_repository.dart';

part 'weed_stats_event.dart';
part 'weed_stats_state.dart';

class WeedStatsBloc extends Bloc<WeedStatsEvent, WeedStatsState> {
  final OrganizationRepository _organizationRepository;
  final WeedRepository _weedRepository;

  WeedStatsBloc({
    required OrganizationRepository organizationRepository,
    required WeedRepository weedRepository,
  })  : _organizationRepository = organizationRepository,
        _weedRepository = weedRepository,
        super(const WeedStatsState()) {
    on<WeedStatsLoadPayWeekEvent>(_onLoadPayWeek);
  }

  Future<void> _onLoadPayWeek(
    WeedStatsLoadPayWeekEvent event,
    Emitter<WeedStatsState> emit,
  ) async {
    emit(state.copyWith(status: WeedStatsStatus.loading));
    try {
      final organzation =
          await _organizationRepository.getOrganization(event.orgId);

      final weedActivities =
          await _weedRepository.getWeedActivitiesPayWeek(event.orgId);
      //print('weedActivities: $weedActivities');

      // Functions to get rest of stats for WeedStatsState
      // dirtyEarned
      double dirtyEarned = 0;
      double totalKickback = 0;
      double totalGrossProfit = 0;

      for (final a in weedActivities) {
        dirtyEarned += a.money.isEmpty ? 0 : double.parse(a.money);

        double percentage = a.percentage == '' ? 0 : double.parse(a.percentage);
        if (percentage != 0.0) {
          totalKickback += double.parse(a.money) * (percentage / 100);
        }
      }

      List<Map<String, dynamic>> sellersList = [];
      for (final a in weedActivities) {
        // {name: '' ,'money': 6700, 'bags': 100}
        if (a.activity == 'Weed: Sell') {
          Map<String, dynamic> seller = {};
          seller.addAll({
            'name': a.name,
            'money': int.parse(a.money),
            'bags': int.parse(a.bags)
          });

          if (sellersList.any((o) => o['name'] == seller['name'])) {
            for (int i = 0; i < sellersList.length; i++) {
              if (sellersList[i]['name'] == seller['name']) {
                sellersList[i]['money'] += seller['money'];
                sellersList[i]['bags'] += seller['bags'];
              }
            }
          } else {
            sellersList.add(seller);
          }
        }
      }
      print(sellersList);

      totalGrossProfit = dirtyEarned - totalKickback;
      //print(dirtyEarned.toString());
      //print(totalKickback.toString());

      emit(state.copyWith(
        status: WeedStatsStatus.payWeek,
        organization: organzation,
        activities: weedActivities,
        totalDirtyEarned: dirtyEarned.toString(),
        totalKickback: totalKickback.toString(),
        totalGrossProfit: totalGrossProfit.toString(),
        sellersList: sellersList,
      ));
    } catch (e) {
      print('onLoadPayWeek: ${e.toString()}');
      emit(state.copyWith(status: WeedStatsStatus.error));
    }
  }
}

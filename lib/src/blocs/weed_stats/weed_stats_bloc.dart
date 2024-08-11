import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:org_management/src/repositories/organization_repository.dart';
import 'package:org_management/src/repositories/weed_repository.dart';
import 'package:org_management/src/services/weed_stats_data.dart';

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
      // final organzation =
      //     await _organizationRepository.getOrganization(event.orgId);
      final organzation = await _organizationRepository
          .getOrganization('YNOzPInJtURUjhCluLS4PwUBK4Q2');

      // final weedActivities =
      //     await _weedRepository.getWeedActivitiesPayWeek(event.orgId);
      final weedActivities = await _weedRepository
          .getWeedActivitiesPayWeek('YNOzPInJtURUjhCluLS4PwUBK4Q2');
      //print('weedActivities: $weedActivities');

      final sellersList = WeedStatsData.getSellersList(weedActivities);
      //print(sellersList);

      int totalSold = 0;

      for (final s in sellersList) {
        int money = s['money'];
        totalSold += money;
      }

      final growersList =
          WeedStatsData.getGrowersList(weedActivities, totalSold);
      print(growersList);

      final moneyData =
          WeedStatsData.getWeedMoneyData(sellersList, growersList);
      print(moneyData);

      emit(state.copyWith(
        status: WeedStatsStatus.payWeek,
        organization: organzation,
        activities: weedActivities,
        sellersList: sellersList,
        totalDirtyEarned: moneyData['dirtyEarned'].toString(),
        totalKickback: moneyData['totalKickback'].toString(),
        totalGrossProfit: moneyData['totalGrossProfit'].toString(),
      ));
    } catch (e) {
      print('onLoadPayWeek: ${e.toString()}');
      emit(state.copyWith(status: WeedStatsStatus.error));
    }
  }
}

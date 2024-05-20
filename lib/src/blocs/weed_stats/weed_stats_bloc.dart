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
      print('weedActivities: $weedActivities');

      // Functions to get rest of stats for WeedStatsState
      // dirtyEarned
      double dirtyEarned = 0;
      double totalKickback = 0;
      for (final a in weedActivities) {
        dirtyEarned += double.parse(a.money);
        
        double percentage =
            double.parse(a.percentage == '' ? '0' : a.percentage);
        if (percentage != 0) {
          totalKickback += (double.parse(a.money) * (percentage / 100));
        }
      }

      print(dirtyEarned.toString());
      print(totalKickback.toString());

      emit(state.copyWith(
        status: WeedStatsStatus.payWeek,
        organization: organzation,
        activities: weedActivities,
      ));
    } catch (e) {
      print('onLoadPayWeek: $e');
      emit(state.copyWith(status: WeedStatsStatus.error));
    }
  }
}

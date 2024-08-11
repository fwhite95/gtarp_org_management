import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:org_management/src/repositories/moonshine_repository.dart';
import 'package:org_management/src/repositories/organization_repository.dart';
import 'package:org_management/src/services/moonshine_stats_data.dart';

part 'moonshine_stats_event.dart';
part 'moonshine_stats_state.dart';

class MoonshineStatsBloc
    extends Bloc<MoonshineStatsEvent, MoonshineStatsState> {
  final MoonshineRepository _moonshineRepository;
  final OrganizationRepository _organizationRepository;

  MoonshineStatsBloc({
    required MoonshineRepository moonshineRepository,
    required OrganizationRepository organizationRepository,
  })  : _moonshineRepository = moonshineRepository,
        _organizationRepository = organizationRepository,
        super(const MoonshineStatsState()) {
    on<MoonshineStatsLoadPayWeekEvent>(_onLoadPayWeek);
  }

  Future<void> _onLoadPayWeek(
    MoonshineStatsLoadPayWeekEvent event,
    Emitter<MoonshineStatsState> emit,
  ) async {
    emit(state.copyWith(status: MoonshineStatsStatus.loading));
    try {
      // final organzation =
      //     await _organizationRepository.getOrganization(event.orgId);
      final organzation = await _organizationRepository
          .getOrganization('YNOzPInJtURUjhCluLS4PwUBK4Q2');

      final moonshineActivities = await _moonshineRepository
          .getMoonshineActivitiesPayWeek('YNOzPInJtURUjhCluLS4PwUBK4Q2');

      final Map<String, dynamic> map = MoonshineStatsData.getMoonshineList(
          moonshineActivities, organzation.crimeActions);

      final Map<String, dynamic> moneyData =
          MoonshineStatsData.getMoonShineMoneyData(map);
          

      emit(state.copyWith(
        status: MoonshineStatsStatus.payWeek,
        activities: moonshineActivities,
        totalDirtyEarned: moneyData['dirtyEarned'].toString(),
        totalKickback: moneyData['totalKickback'].toString(),
        totalGrossProfit: moneyData['totalGrossProfit'].toString(),
      ));
    } catch (e) {
      print('onLoadPayWeek: ${e.toString()}');
      emit(state.copyWith(status: MoonshineStatsStatus.error));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:org_management/src/repositories/cleaning_repository.dart';
import 'package:org_management/src/repositories/heist_repository.dart';
import 'package:org_management/src/repositories/moonshine_repository.dart';
import 'package:org_management/src/repositories/organization_repository.dart';
import 'package:org_management/src/repositories/theft_repository.dart';
import 'package:org_management/src/repositories/weed_repository.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final WeedRepository _weedRepository;
  final MoonshineRepository _moonshineRepository;
  final HeistRepository _heistRepository;
  final TheftRepository _theftRepository;
  final CleaningRepository _cleaningRepository;
  final OrganizationRepository _organizationRepository;

  DashboardBloc({
    required WeedRepository weedRepository,
    required MoonshineRepository moonshineRepository,
    required HeistRepository heistRepository,
    required TheftRepository theftRepository,
    required CleaningRepository cleaningRepository,
    required OrganizationRepository organizationRepository,
  })  : _weedRepository = weedRepository,
        _moonshineRepository = moonshineRepository,
        _heistRepository = heistRepository,
        _theftRepository = theftRepository,
        _cleaningRepository = cleaningRepository,
        _organizationRepository = organizationRepository,
        super(const DashboardState()) {
    on<DashboardLoadEvent>(_onLoadEvent);
    on<DashboardLoadWeed>(_onLoadWeed);
    on<DashboardLoadMoonshine>(_onLoadMoonshine);
    on<DashboardLoadHeist>(_onLoadHeist);
    on<DashboardLoadTheft>(_onLoadTheft);
    on<DashboardLoadCleaning>(_onLoadCleaning);
    on<DashboardCreateWeedActivity>(_onCreateWeed);
    on<DashboardCreateMoonshineActivity>(_onCreateMoonshine);
    on<DashboardCreateHeistActivity>(_onCreateHeist);
    on<DashboardCreateTheftActivity>(_onCreateTheft);
    on<DashboardCreateCleaningActivity>(_onCreateCleaning);
    on<DashboardDeleteWeedActivity>(_onDeleteWeed);
    on<DashboardDeleteMoonshineActivity>(_onDeleteMoonshine);
    on<DashboardDeleteTheftActivity>(_onDeleteTheft);
    on<DashboardDeleteHeistActivity>(_onDeleteHeist);
    on<DashboardDeleteCleaningActivity>(_onDeleteCleaning);
  }

  Future<void> _onLoadEvent(
    DashboardLoadEvent event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      // await _organizationRepository
      //     .createOrganization(Organization.orgSampleData.first);
      print('OrgId: ${event.orgId}');
      final organzation = await _organizationRepository
          .getOrganization('YNOzPInJtURUjhCluLS4PwUBK4Q2');

      final weedActivities = _weedRepository.getWeedActivities(organzation.id);
      final moonshineActivities =
          _moonshineRepository.getMoonshineActivities(organzation.id);
      final heistActivities =
          _heistRepository.getHeistActivities(organzation.id);
      final theftActivities =
          _theftRepository.getTheftActivities(organzation.id);
      final cleaningActivities =
          _cleaningRepository.getCleaningActivities(organzation.id);

      final results = await Future.wait([
        weedActivities,
        moonshineActivities,
        heistActivities,
        theftActivities,
        cleaningActivities,
      ]);
      List<Crime> activities = [];
      for (final list in results) {
        activities.addAll(list);
      }

      emit(state.copyWith(
        status: DashboardStatus.loaded,
        activities: activities,
        organization: organzation,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onLoadWeed(
    DashboardLoadWeed event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final weedActivities =
          _weedRepository.getWeedActivities(state.organization.id);
      final results = await Future.wait([weedActivities]);

      emit(state.copyWith(
        status: DashboardStatus.weed,
        activities: results[0],
        crimeTag: event.crimeTag,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onLoadMoonshine(
    DashboardLoadMoonshine event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final moonshineActivities =
          _moonshineRepository.getMoonshineActivities(state.organization.id);
      final results = await Future.wait([moonshineActivities]);

      emit(state.copyWith(
        status: DashboardStatus.moonshine,
        activities: results[0],
        crimeTag: event.crimeTag,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onLoadHeist(
    DashboardLoadHeist event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final heistActivities =
          _heistRepository.getHeistActivities(state.organization.id);
      final results = await Future.wait([heistActivities]);

      emit(state.copyWith(
        status: DashboardStatus.heist,
        activities: results[0],
        crimeTag: event.crimeTag,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onLoadTheft(
    DashboardLoadTheft event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final theftActivities =
          _theftRepository.getTheftActivities(state.organization.id);
      final results = await Future.wait([theftActivities]);

      emit(state.copyWith(
        status: DashboardStatus.theft,
        activities: results[0],
        crimeTag: event.crimeTag,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onLoadCleaning(
    DashboardLoadCleaning event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final cleaningActivities =
          _cleaningRepository.getCleaningActivities(state.organization.id);
      final results = await Future.wait([cleaningActivities]);

      emit(state.copyWith(
        status: DashboardStatus.cleaning,
        activities: results[0],
        crimeTag: event.crimeTag,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onCreateWeed(
    DashboardCreateWeedActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      await _weedRepository.createWeedActivity(
          state.organization.id, event.weedActivity);

      emit(state.copyWith(
        status: DashboardStatus.weed,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onCreateMoonshine(
    DashboardCreateMoonshineActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final list = await _moonshineRepository.createMoonshineActivity(
          state.organization.id, event.moonshineActivity);
      print(
        'list: $list',
      );
      emit(state.copyWith(
        status: DashboardStatus.moonshine,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onCreateHeist(
    DashboardCreateHeistActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final list = await _heistRepository.createHeistActivity(
          state.organization.id, event.heistActivity);
      print(
        'list: $list',
      );
      emit(state.copyWith(
        status: DashboardStatus.heist,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onCreateTheft(
    DashboardCreateTheftActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final list = await _theftRepository.createTheftActivity(
          state.organization.id, event.theftActivity);
      print(
        'list: $list',
      );
      emit(state.copyWith(
        status: DashboardStatus.theft,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onCreateCleaning(
    DashboardCreateCleaningActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      final list = await _cleaningRepository.createCleaningActivity(
          state.organization.id, event.cleaningActivity);
      print(
        'list: $list',
      );
      emit(state.copyWith(
        status: DashboardStatus.cleaning,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onDeleteWeed(
    DashboardDeleteWeedActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      _weedRepository.deleteWeedActivity(
        state.organization.id,
        event.weedActivity.crimeId,
      );

      emit(state.copyWith(
        status: DashboardStatus.weed,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onDeleteMoonshine(
    DashboardDeleteMoonshineActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      _moonshineRepository.deleteMoonshineActivity(
        state.organization.id,
        event.moonshineActivity.crimeId,
      );

      emit(state.copyWith(
        status: DashboardStatus.moonshine,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onDeleteTheft(
    DashboardDeleteTheftActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      _theftRepository.deleteTheftActivity(
        state.organization.id,
        event.theftActivity.crimeId,
      );

      emit(state.copyWith(
        status: DashboardStatus.theft,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onDeleteHeist(
    DashboardDeleteHeistActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      _heistRepository.deleteHeistActivity(
        state.organization.id,
        event.heistActivity.crimeId,
      );

      emit(state.copyWith(
        status: DashboardStatus.heist,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }

  Future<void> _onDeleteCleaning(
    DashboardDeleteCleaningActivity event,
    Emitter<DashboardState> emit,
  ) async {
    emit(state.copyWith(status: DashboardStatus.loading));

    try {
      _cleaningRepository.deleteCleaningActivity(
        state.organization.id,
        event.cleaningActivity.crimeId,
      );

      emit(state.copyWith(
        status: DashboardStatus.cleaning,
      ));
    } catch (_) {
      print('bloc err: $_');
      emit(state.copyWith(status: DashboardStatus.error));
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:models/models.dart';
import 'package:org_management/src/repositories/organization_repository.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  final OrganizationRepository _organizationRepository;

  AdminBloc({
    required OrganizationRepository organizationRepository,
  })  : _organizationRepository = organizationRepository,
        super(const AdminState()) {
    on<AdminLoadEvent>(_onLoadEvent);
    on<AdminLoadMembers>(_onLoadMembers);
    on<AdminLoadRanks>(_onLoadRanks);
    on<AdminLoadActions>(_onLoadActions);
    on<AdminSaveMemberEvent>(_onSaveMember);
    on<AdminCreateMemberEvent>(_onCreateMember);
    on<AdminSaveRankEvent>(_onSaveRank);
    on<AdminCreateRankEvent>(_onCreateRank);
  }

  Future<void> _onLoadEvent(
    AdminLoadEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      emit(state.copyWith(
        status: AdminStatus.members,
        organization: event.organization,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onLoadMembers(
    AdminLoadMembers event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      emit(state.copyWith(
        status: AdminStatus.members,
        organization: event.organization,
        selection: event.selection,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onLoadRanks(
    AdminLoadRanks event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      emit(state.copyWith(
        status: AdminStatus.ranks,
        organization: event.organization,
        selection: event.selection,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onLoadActions(
    AdminLoadActions event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      emit(state.copyWith(
        status: AdminStatus.actions,
        organization: event.organization,
        selection: event.selection,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onSaveMember(
    AdminSaveMemberEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      state.organization.members[event.index] = event.member;
      await _organizationRepository.updateOrganization(state.organization);

      emit(state.copyWith(
        status: AdminStatus.members,
        organization: state.organization,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onCreateMember(
    AdminCreateMemberEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      state.organization.members.add(event.member);
      await _organizationRepository.updateOrganization(state.organization);

      emit(state.copyWith(
        status: AdminStatus.members,
        organization: state.organization,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onSaveRank(
    AdminSaveRankEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      state.organization.ranks[event.index] = event.rank;
      await _organizationRepository.updateOrganization(state.organization);

      emit(state.copyWith(
        status: AdminStatus.ranks,
        organization: state.organization,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }

  Future<void> _onCreateRank(
    AdminCreateRankEvent event,
    Emitter<AdminState> emit,
  ) async {
    emit(state.copyWith(status: AdminStatus.loading));

    try {
      state.organization.ranks.add(event.rank);
      await _organizationRepository.updateOrganization(state.organization);

      emit(state.copyWith(
        status: AdminStatus.ranks,
        organization: state.organization,
      ));
    } catch (e) {
      print('AdminBloc error: $e');
      emit(state.copyWith(status: AdminStatus.error));
    }
  }
}

part of 'admin_bloc.dart';

abstract class AdminEvent extends Equatable {
  const AdminEvent();

  @override
  List<Object> get props => [];
}

class AdminLoadEvent extends AdminEvent {
  const AdminLoadEvent(this.organization);
  final Organization organization;

  @override
  List<Object> get props => [
        organization,
      ];
}

class AdminLoadMembers extends AdminEvent {
  const AdminLoadMembers(this.organization);
  final Organization organization;

  @override
  List<Object> get props => [
        organization,
      ];
}

class AdminLoadRanks extends AdminEvent {
  const AdminLoadRanks(this.organization);
  final Organization organization;

  @override
  List<Object> get props => [
        organization,
      ];
}

class AdminLoadActions extends AdminEvent {
  const AdminLoadActions(this.organization);
  final Organization organization;

  @override
  List<Object> get props => [
        organization,
      ];
}

class AdminSaveMemberEvent extends AdminEvent {
  const AdminSaveMemberEvent(
    this.member,
    this.index,
  );
  final Member member;
  final int index;

  @override
  List<Object> get props => [
        member,
        index,
      ];
}

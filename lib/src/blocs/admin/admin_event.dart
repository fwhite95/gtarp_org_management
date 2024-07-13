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
  const AdminLoadMembers(this.organization, this.selection);
  final Organization organization;
  final String selection;

  @override
  List<Object> get props => [organization, selection];
}

class AdminLoadRanks extends AdminEvent {
  const AdminLoadRanks(this.organization, this.selection);
  final Organization organization;
  final String selection;

  @override
  List<Object> get props => [
        organization,
      ];
}

class AdminLoadActions extends AdminEvent {
  const AdminLoadActions(this.organization, this.selection);
  final Organization organization;
  final String selection;

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

class AdminCreateMemberEvent extends AdminEvent {
  const AdminCreateMemberEvent(
    this.member,
  );
  final Member member;

  @override
  List<Object> get props => [
        member,
      ];
}

class AdminSaveRankEvent extends AdminEvent {
  const AdminSaveRankEvent(
    this.rank,
    this.index,
  );
  final String rank;
  final int index;

  @override
  List<Object> get props => [
        rank,
        index,
      ];
}

class AdminCreateRankEvent extends AdminEvent {
  const AdminCreateRankEvent(
    this.rank,
  );
  final String rank;

  @override
  List<Object> get props => [
        rank,
      ];
}

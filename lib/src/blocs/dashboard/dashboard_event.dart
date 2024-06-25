part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable {
  const DashboardEvent();

  @override
  List<Object> get props => [];
}

class DashboardLoadEvent extends DashboardEvent {
  const DashboardLoadEvent(this.orgId);

  final String orgId;

  @override
  List<Object> get props => [
        orgId,
      ];
}

class DashboardLoadWeed extends DashboardEvent {
  const DashboardLoadWeed(this.crimeTag);
  final String crimeTag;

  @override
  List<Object> get props => [
        crimeTag,
      ];
}

class DashboardLoadMoonshine extends DashboardEvent {
  const DashboardLoadMoonshine(this.crimeTag);
  final String crimeTag;

  @override
  List<Object> get props => [
        crimeTag,
      ];
}

class DashboardLoadHeist extends DashboardEvent {
  const DashboardLoadHeist(this.crimeTag);
  final String crimeTag;

  @override
  List<Object> get props => [
        crimeTag,
      ];
}

class DashboardLoadTheft extends DashboardEvent {
  const DashboardLoadTheft(this.crimeTag);
  final String crimeTag;

  @override
  List<Object> get props => [
        crimeTag,
      ];
}

class DashboardLoadCleaning extends DashboardEvent {
  const DashboardLoadCleaning(this.crimeTag);
  final String crimeTag;

  @override
  List<Object> get props => [
        crimeTag,
      ];
}

class DashboardCreateWeedActivity extends DashboardEvent {
  const DashboardCreateWeedActivity(this.weedActivity);

  final WeedActivity weedActivity;

  @override
  List<Object> get props => [
        weedActivity,
      ];
}

class DashboardCreateMoonshineActivity extends DashboardEvent {
  const DashboardCreateMoonshineActivity(this.moonshineActivity);

  final MoonshineActivity moonshineActivity;

  @override
  List<Object> get props => [
        moonshineActivity,
      ];
}

class DashboardCreateHeistActivity extends DashboardEvent {
  const DashboardCreateHeistActivity(this.heistActivity);

  final HeistActivity heistActivity;

  @override
  List<Object> get props => [
        heistActivity,
      ];
}

class DashboardCreateTheftActivity extends DashboardEvent {
  const DashboardCreateTheftActivity(this.theftActivity);

  final TheftActivity theftActivity;

  @override
  List<Object> get props => [
        theftActivity,
      ];
}

class DashboardCreateCleaningActivity extends DashboardEvent {
  const DashboardCreateCleaningActivity(this.cleaningActivity);

  final CleaningActivity cleaningActivity;

  @override
  List<Object> get props => [
        cleaningActivity,
      ];
}

class DashboardDeleteWeedActivity extends DashboardEvent {
  const DashboardDeleteWeedActivity(this.weedActivity);

  final WeedActivity weedActivity;

  @override
  List<Object> get props => [
        weedActivity,
      ];
}

class DashboardDeleteMoonshineActivity extends DashboardEvent {
  const DashboardDeleteMoonshineActivity(this.moonshineActivity);

  final MoonshineActivity moonshineActivity;

  @override
  List<Object> get props => [
        moonshineActivity,
      ];
}

class DashboardDeleteTheftActivity extends DashboardEvent {
  const DashboardDeleteTheftActivity(this.theftActivity);

  final TheftActivity theftActivity;

  @override
  List<Object> get props => [
        theftActivity,
      ];
}

class DashboardDeleteHeistActivity extends DashboardEvent {
  const DashboardDeleteHeistActivity(this.heistActivity);

  final HeistActivity heistActivity;

  @override
  List<Object> get props => [
        heistActivity,
      ];
}

class DashboardDeleteCleaningActivity extends DashboardEvent {
  const DashboardDeleteCleaningActivity(this.cleaningActivity);

  final CleaningActivity cleaningActivity;

  @override
  List<Object> get props => [
        cleaningActivity,
      ];
}

part of 'dashboard_bloc.dart';

// weed, moonshine, heist, theft, cleaning
enum DashboardStatus {
  intial,
  loading,
  loaded,
  error,
  weed,
  moonshine,
  cleaning,
  heist,
  theft,
}

class DashboardState extends Equatable {
  const DashboardState({
    this.status = DashboardStatus.intial,
    this.activities = const [],
    this.organization = const Organization(
      id: '',
      name: '',
      members: [],
      ranks: [],
      crimeActions: [],
    ),
    this.crimeTag = 'All',
  });

  final DashboardStatus status;
  final List<Crime> activities;
  final Organization organization;
  final String crimeTag;

  DashboardState copyWith({
    DashboardStatus? status,
    List<Crime>? activities,
    Organization? organization,
    String? crimeTag,
  }) {
    return DashboardState(
      status: status ?? this.status,
      activities: activities ?? this.activities,
      organization: organization ?? this.organization,
      crimeTag: crimeTag ?? this.crimeTag,
    );
  }

  @override
  List<Object> get props => [
        status,
        activities,
        organization,
        crimeTag,
      ];
}

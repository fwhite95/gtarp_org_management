part of 'admin_bloc.dart';

enum AdminStatus {
  initial,
  loading,
  error,
  members,
  ranks,
  actions,
}

class AdminState extends Equatable {
  const AdminState({
    this.status = AdminStatus.initial,
    this.organization = const Organization(
      id: '',
      name: '',
      members: [],
      ranks: [],
      crimeActions: [],
    ),
  });

  final AdminStatus status;
  final Organization organization;

  AdminState copyWith({
    AdminStatus? status,
    Organization? organization,
  }) {
    return AdminState(
      status: status ?? this.status,
      organization: organization ?? this.organization,
    );
  }

  @override
  List<Object> get props => [
        status,
        organization,
      ];
}

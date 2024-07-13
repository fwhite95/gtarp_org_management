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
    this.selection = 'Members',
    this.index,
  });

  final AdminStatus status;
  final Organization organization;
  final int? index;
  final String selection;

  AdminState copyWith({
    AdminStatus? status,
    Organization? organization,
    String? selection,
  }) {
    return AdminState(
      status: status ?? this.status,
      organization: organization ?? this.organization,
      selection: selection ?? this.selection,
    );
  }

  @override
  List<Object> get props => [
        status,
        organization,
        selection,
      ];
}

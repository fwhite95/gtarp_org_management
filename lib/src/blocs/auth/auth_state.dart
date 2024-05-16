part of 'auth_cubit.dart';

enum AuthStatus { authenticated, unauthenticated }

class AuthState extends Equatable {
  const AuthState({
    required this.email,
    required this.password,
    required this.uid,
    required this.status,
  });

  final String email;
  final String password;
  final String uid;
  final AuthStatus status;

  factory AuthState.unauthenticated() {
    return const AuthState(
      email: '',
      password: '',
      uid: '',
      status: AuthStatus.unauthenticated,
    );
  }

  AuthState copyWith({
    String? email,
    String? password,
    String? uid,
    AuthStatus? status,
  }) {
    return AuthState(
      email: email ?? this.email,
      password: password ?? this.password,
      uid: uid ?? this.uid,
      status: status ?? this.status,
    );
  }

  @override
  List<Object> get props => [
        email,
        password,
        uid,
        status,
      ];
}

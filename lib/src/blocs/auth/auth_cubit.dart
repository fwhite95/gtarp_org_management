import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:org_management/src/repositories/auth_repository.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(AuthState.unauthenticated());

  void emailChanged(String value) {
    emit(state.copyWith(email: value));
  }

  void passwordChanged(String value) {
    emit(state.copyWith(password: value));
  }

  void signInPressed() async {
    print('email: ${state.email}, password: ${state.password}');
    try {
      final user = await _authRepository.signIn(state.email, state.password);
      emit(state.copyWith(uid: user.uid, status: AuthStatus.authenticated));
    } catch (e) {
      print(e);
    }
  }
}

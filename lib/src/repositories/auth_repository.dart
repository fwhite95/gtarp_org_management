import 'package:firebase_auth/firebase_auth.dart';
import 'package:org_management/src/apis/auth_api.dart';

class AuthRepository {
  final AuthAPI _authAPI;

  AuthRepository({
    required AuthAPI authAPI,
  }) : _authAPI = authAPI;

  Future<User> signIn(String email, String password) async {
    final user = await _authAPI.signInData(email, password);
    return user;
  }
}

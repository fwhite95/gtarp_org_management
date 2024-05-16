import 'package:firebase_auth/firebase_auth.dart';

abstract class IAuthAPI {
  Future signInData(String email, String password);
}

class AuthAPI implements IAuthAPI {
  final FirebaseAuth _firebaseAuth;
  AuthAPI({
    required FirebaseAuth firebaseAuth,
  }) : _firebaseAuth = firebaseAuth;

  @override
  Future<User> signInData(
    String email,
    String password,
  ) async {
    try {
      final user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return user.user!;
    } catch (_) {
      print('Error: $_');
      throw Error();
    }
  }
}

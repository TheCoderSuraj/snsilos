import '../../../utils/firebase_callback_listener.dart';
import 'firebase_auth/auth_firebase.dart';

class Auth {
  static Future<bool> registerWithEmailPassword({
    required String email,
    required String password,
    FirebaseCallbackListener? listener,
  }) async {
    return AuthFirebase.registerWithEmailPassword(
      email: email,
      password: password,
      listener: listener,
    );
  }

  static Future<bool> loginWithEmailPassword({
    required String email,
    required String password,
    FirebaseCallbackListener? listener,
  }) async {
    return AuthFirebase.loginWithEmailPassword(
      email: email,
      password: password,
      listener: listener,
    );
  }
}

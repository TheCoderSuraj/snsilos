import 'package:firebase_auth/firebase_auth.dart';

import '../../../utils/firebase_callback_listener.dart';
import 'firebase_auth/auth_firebase.dart';

class AuthApi {
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

  static User? getCurrentUser() {
    return AuthFirebase.getCurrentUser();
  }

  static bool? isUserLoggedIn() {
    return AuthFirebase.isUserLoggedIn();
  }

  static Future<void> signOut({
    FirebaseCallbackListener? listener,
  }) async {
    return AuthFirebase.signOut(listener: listener);
  }
}

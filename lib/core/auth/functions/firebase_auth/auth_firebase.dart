import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../utils/firebase_callback_listener.dart';

part 'login.dart';
part 'register.dart';

class AuthFirebase {
  static FirebaseAuth _getInstance() {
    return FirebaseAuth.instance;
  }

  static User? getCurrentUser() {
    return _getInstance().currentUser;
  }

  static bool? isUserLoggedIn() {
    return _getInstance().currentUser != null;
  }

  static Future<bool> registerWithEmailPassword({
    required String email,
    required String password,
    FirebaseCallbackListener? listener,
  }) async {
    return _registerWithEmailPassword(
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
    return _loginWithEmailPassword(
      email: email,
      password: password,
      listener: listener,
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:sn_silos/core/auth/functions/auth.dart';

import '../../../../../models/user_model.dart';
import '../../../../../utils/constants.dart';
import '../../../../../utils/firebase_callback_listener.dart';

part 'add_user.dart';
part 'get_user.dart';
part 'update_user.dart';

class UserFireStoreDatabase {
  static FirebaseFirestore getInstance() {
    return FirebaseFirestore.instance;
  }

  static Future<bool> addUser({
    required String uid,
    required UserModel user,
    FirebaseCallbackListener? listener,
  }) async {
    return _addUser(
      uid: uid,
      user: user,
      listener: listener,
    );
  }

  static Future<bool> updateUser({
    required String uid,
    required UserModel user,
    FirebaseCallbackListener? listener,
  }) async {
    return _updateUser(
      uid: uid,
      user: user,
      listener: listener,
    );
  }

  static Future<UserModel?> getUser({
    FirebaseCallbackListener? listener,
  }) async {
    if (!AuthApi.isUserLoggedIn()) {
      listener?.call(error: "User not logged in");
      return null;
    }
    return _getUser(
      uid: AuthApi.getCurrentUser()!.uid,
      listener: listener,
    );
  }
}

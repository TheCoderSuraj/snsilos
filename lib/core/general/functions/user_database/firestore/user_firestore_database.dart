import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../models/user_model.dart';
import '../../../../../utils/firebase_callback_listener.dart';

part 'add_user.dart';

class UserFireStoreDatabase {
  static const _UserCollectionName = "Users";
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
}

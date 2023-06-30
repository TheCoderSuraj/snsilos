import 'package:sn_silos/core/auth/functions/firebase_auth/auth_firebase.dart';
import 'package:sn_silos/core/general/functions/user_database/firestore/user_firestore_database.dart';

import '../../../../models/user_model.dart';
import '../../../../utils/firebase_callback_listener.dart';

class UserDatabaseApi {
  static Future<bool> addUser({
    required UserModel user,
    FirebaseCallbackListener? listener,
  }) async {
    if (!(AuthFirebase.isUserLoggedIn())) return false;
    return UserFireStoreDatabase.addUser(
      uid: AuthFirebase.getCurrentUser()!.uid,
      user: user,
      listener: listener,
    );
  }

  static Future<bool> updateUser({
    required UserModel user,
    FirebaseCallbackListener? listener,
  }) async {
    if (!(AuthFirebase.isUserLoggedIn())) return false;
    return UserFireStoreDatabase.updateUser(
      uid: AuthFirebase.getCurrentUser()!.uid,
      user: user,
      listener: listener,
    );
  }

  static Future<UserModel?> getUser({
    FirebaseCallbackListener? listener,
  }) async {
    return UserFireStoreDatabase.getUser(
      listener: listener,
    );
  }
}

part of 'user_firestore_database.dart';

Future<bool> _addUser({
  required String uid,
  required UserModel user,
  FirebaseCallbackListener? listener,
}) async {
  listener ??= const FirebaseCallbackListener();
  bool res = false;
  try {
    var data = user.toJson();
    data.remove('joinedDate');
    data['id'] = uid;
    data['joinedDate'] = FieldValue.serverTimestamp();
    await UserFireStoreDatabase.getInstance()
        .collection(apUserCollectionName)
        .doc(uid)
        .set(data)
        .then(
      (value) {
        listener?.call();
        res = true;
      },
      onError: (e) {
        res = false;
        var err = "Login Error: $e";
        debugPrint(err);
        listener?.call(error: err);
      },
    );
  } catch (e) {
    res = false;
    var err = "Login Error: $e";
    debugPrint(err);
    listener.call(error: err);
  }
  return res;
}

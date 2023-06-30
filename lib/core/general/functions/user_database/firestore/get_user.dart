part of 'user_firestore_database.dart';

Future<UserModel?> _getUser({
  required String uid,
  FirebaseCallbackListener? listener,
}) async {
  listener ??= const FirebaseCallbackListener();
  UserModel? res;
  try {
    await UserFireStoreDatabase.getInstance()
        .collection(fUserCollectionName)
        .doc(uid)
        .get()
        .then(
      (value) {
        print("value ${value.data()}");
        if (value.data() != null) {
          res = UserModel.fromJson(value.data()!);
          listener?.call();
          print("value $res");
        } else {
          listener?.call(error: "Null data");
        }
      },
      onError: (e) {
        res = null;
        var err = "Login Error: $e";
        debugPrint(err);
        listener?.call(error: err);
      },
    );
  } catch (e) {
    res = null;
    var err = "Login Error: $e";
    debugPrint(err);
    listener.call(error: err);
  }
  return res;
}

part of 'auth_firebase.dart';

Future<bool> _loginWithEmailPassword({
  required String email,
  required String password,
  FirebaseCallbackListener? listener,
}) async {
  listener ??= const FirebaseCallbackListener();
  bool res = false;
  try {
    await AuthFirebase.getInstance()
        .signInWithEmailAndPassword(email: email, password: password)
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

import 'utility.dart';

class FirebaseCallbackListener {
  const FirebaseCallbackListener({
    this.onSuccess,
    this.onError,
    this.doShowToast = true,
  });

  final Function()? onSuccess;
  final Function(String error)? onError;
  final bool doShowToast;
  void call({String? error}) {
    if (error != null) {
      if (onError != null) onError!(error);
      if (doShowToast) showMyToast("Error: $error", isError: true);
    } else {
      if (onSuccess != null) onSuccess!();
    }
  }
}

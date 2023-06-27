import 'utility.dart';

class FirebaseCallbackListener {
  const FirebaseCallbackListener({
    this.onSuccess,
    this.onError,
  });

  final Function()? onSuccess;
  final Function(String error)? onError;

  void call({String? error}) {
    if (error != null) {
      if (onError != null) onError!(error);
      showMyToast("Error: $error", isError: true);
    } else {
      if (onSuccess != null) onSuccess!();
    }
  }
}

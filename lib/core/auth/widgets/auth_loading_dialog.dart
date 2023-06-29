import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';

void showAuthLoadingDialog({
  required context,
  required String title,
  required Function(FirebaseCallbackListener listener) action,
  required FirebaseCallbackListener listener,
}) async {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      action(FirebaseCallbackListener(
        doShowToast: false,
        onSuccess: () {
          Navigator.pop(context);
          print("we got success");
          listener.call();
        },
        onError: (e) {
          Navigator.pop(context);
          print('error $e');
          listener.call(error: e);
        },
      ));
      return AlertDialog(
        title: Text(title),
        content: SizedBox(
          height: 70,
          child: SpinKitFadingCube(
            size: 50,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      );
    },
  );
}

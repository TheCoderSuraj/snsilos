import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';

void showMyToast(String message, {bool isError = false}) {
  showToast(
    message,
    position: ToastPosition.bottom,
    textStyle: const TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.w400,
    ),
    backgroundColor: isError ? Colors.red[500] : Colors.black,
    textAlign: TextAlign.center,
    textMaxLines: 3,
    textOverflow: TextOverflow.ellipsis,
  );
}

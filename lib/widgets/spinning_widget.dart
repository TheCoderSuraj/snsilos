import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SpinningWidget extends StatelessWidget {
  const SpinningWidget({super.key, this.message = ""});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (message != "")
            Text(
              message,
              // style: kDefaultTextStyle,
            ),
          if (message != "") const SizedBox(height: 10),
          SpinKitFadingCube(
            color: Colors.lightBlue[300],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  const CircularButton({
    super.key,
    required this.iconData,
    required this.onPressed,
  });
  final IconData iconData;
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(
        backgroundColor: Colors.grey.withAlpha(100),
        child: IconButton(
          icon: Icon(
            iconData,
            color: Colors.white,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}

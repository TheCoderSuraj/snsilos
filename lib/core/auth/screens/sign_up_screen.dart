import 'package:flutter/material.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

class SignUpScreen extends StatefulWidget {
  static const id = "SignUpScreenId";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageSetup(
        children: [],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

class LoginScreen extends StatefulWidget {
  static const id = "LoginScreenId";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenPageSetup(
        children: [],
      ),
    );
  }
}

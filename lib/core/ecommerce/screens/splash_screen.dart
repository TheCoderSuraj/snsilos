import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static const id = "SplashScreenId";
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    navigate();
  }

  void navigate() async {
    await Future.delayed(const Duration(seconds: 2));
    Future.sync(() {
      Navigator.pushNamedAndRemoveUntil(
          context, LoginScreen.id, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 70,
          child: SpinKitFadingCube(
            size: 50,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}

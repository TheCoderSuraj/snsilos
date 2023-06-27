import 'package:flutter/material.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';
import 'package:sn_silos/core/auth/screens/sign_up_screen.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';

import '../core/general/screens/error_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // Auth Section
      case LoginScreen.id:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
          settings: const RouteSettings(name: LoginScreen.id),
        );
      case SignUpScreen.id:
        return MaterialPageRoute(
          builder: (context) => const SignUpScreen(),
          settings: const RouteSettings(name: SignUpScreen.id),
        );

      // General Section
      case HomeScreen.id:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
          settings: const RouteSettings(name: HomeScreen.id),
        );

      default:
        return _errorRoute(message: "Unexpected Screen");
    }
  }

  static Route<dynamic> _errorRoute({String? message}) {
    return MaterialPageRoute(
        builder: (context) => ErrorScreen(
              message: message,
            ));
  }
}

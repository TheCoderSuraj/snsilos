import 'package:flutter/material.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';

import '../core/general/screens/error_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      // general
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

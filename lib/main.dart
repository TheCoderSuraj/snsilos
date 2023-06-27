import 'package:flutter/material.dart';
import 'package:sn_silos/utils/theme_data.dart';

import 'utils/route_generator.dart';

void main() {
  runApp(const SnSilosApp());
}

class SnSilosApp extends StatelessWidget {
  const SnSilosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeData,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

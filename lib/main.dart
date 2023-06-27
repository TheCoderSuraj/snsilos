import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';
import 'package:sn_silos/utils/theme_data.dart';

import 'firebase_options.dart';
import 'utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // running application
  runApp(const SnSilosApp());
}

class SnSilosApp extends StatelessWidget {
  const SnSilosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightThemeData,
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: HomeScreen.id,
    );
  }
}

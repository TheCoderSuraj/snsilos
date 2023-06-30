import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';
import 'package:sn_silos/core/general/providers/home_provider.dart';
import 'package:sn_silos/utils/theme_data.dart';

import 'core/ecommerce/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'utils/route_generator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initializing firebase
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // running application
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider()),
    ],
    child: const SnSilosApp(),
  ));
}

class SnSilosApp extends StatelessWidget {
  const SnSilosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        theme: lightThemeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: SplashScreen.id,
        // initialRoute: CartScreen.id,
        // home: ProductDetailScreen(
        //   product: ProductModel.demo(),
        // ),
      ),
    );
  }
}

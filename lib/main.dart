import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';
import 'package:sn_silos/core/ecommerce/screens/cart_screen.dart';
import 'package:sn_silos/core/ecommerce/screens/product_detail_screen.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';
import 'package:sn_silos/models/product_model.dart';
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
    return OKToast(
      child: MaterialApp(
        theme: lightThemeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: LoginScreen.id,
        // initialRoute: CartScreen.id,
        // home: ProductDetailScreen(
        //   product: ProductModel.demo(),
        // ),
      ),
    );
  }
}

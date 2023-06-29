import 'package:flutter/material.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';
import 'package:sn_silos/core/auth/screens/sign_up_screen.dart';
import 'package:sn_silos/core/ecommerce/screens/cart_screen.dart';
import 'package:sn_silos/core/ecommerce/screens/product_detail_screen.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';
import 'package:sn_silos/models/product_model.dart';

import '../core/general/screens/error_screen.dart';

class RouteGenerator {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    var args = settings.arguments;

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

      // E-commerce Section
      case CartScreen.id:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
          settings: const RouteSettings(name: CartScreen.id),
        );
      case ProductDetailScreen.id:
        if (args is ProductModel) {
          return MaterialPageRoute(
            builder: (context) => ProductDetailScreen(
              product: args,
            ),
            settings: const RouteSettings(name: ProductDetailScreen.id),
          );
        }
        return _errorRoute(message: "Invalid Product Details");

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

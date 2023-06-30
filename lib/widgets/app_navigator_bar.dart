import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sn_silos/core/ecommerce/screens/cart_screen.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';

import '../core/general/providers/home_provider.dart';
import '../core/general/screens/profile_screen.dart';

class AppBottomNavigatorBar extends StatelessWidget {
  const AppBottomNavigatorBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, value, child) {
      return BottomNavigationBar(
        currentIndex: value.currentBottomNavigatorIndex,
        onTap: (v) {
          print("you clicked $v");
          if (v == value.currentBottomNavigatorIndex) return;
          switch (v) {
            case 0:
              Navigator.pushNamedAndRemoveUntil(
                  context, HomeScreen.id, (r) => false);
            case 1:
              Navigator.pushNamedAndRemoveUntil(
                  context, CartScreen.id, (r) => false);
            case 2:
              Navigator.pushNamedAndRemoveUntil(
                  context, ProfileScreen.id, (r) => false);
          }
          context.read<HomeProvider>().setBottomNavigatorIndex(v);
        },
        showUnselectedLabels: false,
        selectedIconTheme: const IconThemeData(size: 30),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart_outlined,
              ),
              label: "Cart"),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
              ),
              label: "Profile"),
        ],
      );
    });
  }
}

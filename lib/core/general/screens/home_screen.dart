import 'package:flutter/material.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

class HomeScreen extends StatelessWidget {
  static const id = "HomeScreenId";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: const ScreenPageSetup(
        children: [],
      ),
    );
  }
}

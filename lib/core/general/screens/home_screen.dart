import 'package:flutter/material.dart';
import 'package:sn_silos/core/auth/functions/auth.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

class HomeScreen extends StatelessWidget {
  static const id = "HomeScreenId";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
        actions: [
          IconButton(
            onPressed: () {
              AuthApi.signOut(listener: FirebaseCallbackListener(
                onSuccess: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, LoginScreen.id, (route) => false);
                },
              ));
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: const ScreenPageSetup(
        children: [],
      ),
    );
  }
}

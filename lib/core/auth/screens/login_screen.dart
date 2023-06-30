import 'package:flutter/material.dart';
import 'package:sn_silos/core/auth/functions/auth.dart';
import 'package:sn_silos/core/auth/functions/firebase_auth/auth_firebase.dart';
import 'package:sn_silos/core/auth/screens/sign_up_screen.dart';
import 'package:sn_silos/core/auth/widgets/auth_loading_dialog.dart';
import 'package:sn_silos/core/auth/widgets/password_field.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/validity_methods.dart';
import 'package:sn_silos/widgets/action_button.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

class LoginScreen extends StatefulWidget {
  static const id = "LoginScreenId";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  void initState() {
    super.initState();

    if (AuthApi.isUserLoggedIn() ?? false) {
      Navigator.pushNamedAndRemoveUntil(
        context,
        HomeScreen.id,
        (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: ScreenPageSetup(
          children: [
            const SizedBox(height: 35),
            const Spacer(),
            Text(
              "LogIn Screen",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 25),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: "Email Address"),
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 15),
            PasswordField(
              controller: _passController,
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Center(
              child: ActionButton(
                title: "Log In",
                onPressed: loginAction,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, SignUpScreen.id, (route) => false);
                    },
                    child: const Text("Sign Up!"),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
          ],
        ),
      ),
    );
  }

  void loginAction() {
    if (!(_key.currentState?.validate() ?? false)) return;
    showAuthLoadingDialog(
      context: context,
      title: "Log In",
      action: (listener) {
        AuthFirebase.loginWithEmailPassword(
          email: _emailController.text,
          password: _passController.text,
          listener: listener,
        );
      },
      listener: FirebaseCallbackListener(onError: (err) {
        print("we are failed");
      }, onSuccess: () {
        print("we got success");
        Navigator.pushNamedAndRemoveUntil(
          context,
          HomeScreen.id,
          (route) => false,
        );
      }),
    );
  }
}

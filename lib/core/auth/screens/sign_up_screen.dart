import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sn_silos/core/auth/functions/firebase_auth/auth_firebase.dart';
import 'package:sn_silos/core/auth/screens/login_screen.dart';
import 'package:sn_silos/core/general/functions/user_database/user_database_api.dart';
import 'package:sn_silos/core/general/screens/home_screen.dart';
import 'package:sn_silos/models/user_model.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

import '../../../utils/validity_methods.dart';
import '../../../widgets/action_button.dart';
import '../widgets/password_field.dart';

class SignUpScreen extends StatefulWidget {
  static const id = "SignUpScreenId";
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _key,
        child: ScreenPageSetup(
          children: [
            const SizedBox(height: 35),
            Text(
              "Sign Up Screen",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(labelText: "Name"),
              validator: validateName,
              keyboardType: TextInputType.name,
            ),
            const SizedBox(height: 15),
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
            const SizedBox(height: 15),
            PasswordField(
              labelText: "Confirm Password",
              controller: _confirmPassController,
              validator: (value) {
                if (value == "" || value == null) {
                  return "Required Field";
                } else if (value != _passController.text) {
                  return "Password does not match";
                }
                return null;
              },
            ),
            const SizedBox(height: 20),
            const Spacer(),
            Center(
              child: ActionButton(
                title: "Sign Up",
                onPressed: signUpAction,
              ),
            ),
            const SizedBox(height: 10),
            Center(
              child: Wrap(
                children: [
                  const Text("Already have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, LoginScreen.id, (route) => false);
                    },
                    child: const Text("Log In!"),
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

  int state = 0; // 0 -> loading, 1 -> signup success, 2->
  bool error = false;
  bool isLoading = false;
  void signUpAction() async {
    if (!(_key.currentState?.validate() ?? false)) return;
    error = false;
    setState(() {
      isLoading = true;
    });
    showSignUpDialog(context);
    bool register = await AuthFirebase.registerWithEmailPassword(
      email: _emailController.text,
      password: _passController.text,
      listener: FirebaseCallbackListener(onError: (err) {
        Navigator.pop(context);
        setState(() {
          error = true;
        });
      }, onSuccess: () {
        print("Success registration");
      }),
    );
    if (register) {
      UserModel user = UserModel(
        id: "id",
        name: _nameController.text,
        email: _emailController.text,
        address: [],
      );
      UserDatabaseApi.addUser(
          user: user,
          listener: FirebaseCallbackListener(
            onError: (err) {
              print("user adding error");
            },
            onSuccess: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                HomeScreen.id,
                (route) => false,
              );
            },
          ));
    }
  }

  void showSignUpDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const Text("Registering User"),
          content: SizedBox(
            height: 70,
            child: SpinKitFadingCube(
              size: 50,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        );
      },
    );
  }
}

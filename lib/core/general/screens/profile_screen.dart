import 'package:flutter/material.dart';
import 'package:sn_silos/core/general/functions/user_database/user_database_api.dart';
import 'package:sn_silos/core/general/widgets/name_change_dialog.dart';
import 'package:sn_silos/core/general/widgets/profile_pic.dart';
import 'package:sn_silos/models/user_model.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/loading_dialog.dart';
import 'package:sn_silos/widgets/action_button.dart';
import 'package:sn_silos/widgets/app_navigator_bar.dart';
import 'package:sn_silos/widgets/screen_page_setup.dart';

import '../../../utils/constants.dart';

class ProfileScreen extends StatefulWidget {
  static const id = "ProfileScreenId";
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? user;
  @override
  void initState() {
    super.initState();
    loadUser();
  }

  void loadUser() async {
    await Future.delayed(const Duration(milliseconds: 1));
    Future.sync(() {
      showLoadingDialog(context, title: "loading user data");
    });

    user = await UserDatabaseApi.getUser(
      listener: FirebaseCallbackListener(
        onError: (err) {
          Navigator.pop(context);
        },
        onSuccess: () {
          setState(() {});
          Navigator.pop(context);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: user != null
          ? ScreenPageSetup(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 15, width: double.maxFinite),
                const ProfilePic(
                  image: NetworkImage(kDemoImageUrl),
                ),
                const SizedBox(height: 15),
                Text(
                  user!.name,
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                Text(user!.email),
                const SizedBox(height: 25),
                ActionButton(
                  title: "Change Name",
                  onPressed: () async {
                    String? st = await showNameChangeDialog(context, user!);
                    print(st);
                    if (st != null) {
                      setState(() {
                        user?.name = st;
                      });
                    }
                  },
                )
              ],
            )
          : const SizedBox(),
      bottomNavigationBar: const AppBottomNavigatorBar(),
    );
  }
}

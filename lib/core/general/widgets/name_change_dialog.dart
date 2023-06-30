import 'package:flutter/material.dart';
import 'package:sn_silos/core/general/functions/user_database/user_database_api.dart';
import 'package:sn_silos/models/user_model.dart';
import 'package:sn_silos/utils/firebase_callback_listener.dart';
import 'package:sn_silos/utils/loading_dialog.dart';

Future<String?> showNameChangeDialog(
    BuildContext context, UserModel user) async {
  TextEditingController _nameController =
      TextEditingController(text: user.name);
  String? newName;
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Change Name"),
      content: TextFormField(
        controller: _nameController,
        decoration: const InputDecoration(labelText: "Name"),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancel"),
        ),
        ElevatedButton(
          onPressed: () async {
            if (_nameController.text == "" ||
                _nameController.text == user.name) {
              return;
            }
            showLoadingDialog(context, title: "Updating User");
            UserDatabaseApi.updateUser(
                user: user.copyWith(_nameController.text),
                listener: FirebaseCallbackListener(
                  onSuccess: () {
                    newName = _nameController.text;
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  onError: (err) {
                    Navigator.pop(context);
                  },
                ));
          },
          child: const Text("Save"),
        ),
      ],
    ),
  );
  return newName;
}

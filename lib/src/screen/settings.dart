import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'login.dart';
import 'package:get/get.dart';

class SettingsController extends GetxController{}

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  final SettingsController c = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        FirebaseAuth.instance.signOut().then((response) {
          final localStorage = GetStorage();

          localStorage.remove('logged_user_email');
          Get.offAll(Login());
        });
      },
      child: const Text("Log out"),
    );
  }
}

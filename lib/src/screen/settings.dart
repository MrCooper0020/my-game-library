import 'package:flutter/material.dart';
import 'login.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextButton(
          onPressed: () {
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
          },
          child: const Text("Log out"),
        )
    );
  }
}

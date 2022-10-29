import 'package:flutter/material.dart';
import 'package:my_city/main.dart';

import 'login.dart';

class Start extends StatelessWidget {
  const Start({Key? key}) : super(key: key);

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

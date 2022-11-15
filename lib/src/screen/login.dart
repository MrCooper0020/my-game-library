import 'package:flutter/material.dart';
import 'package:my_city/src/screen/home.dart';
import 'package:my_city/src/screen/register_account.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Login"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(48),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Login",
                      labelText: "Login"
                  ),
                  controller: _loginController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, insert a login';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: "Password",
                      labelText: "Password"
                  ),
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please, insert a password!';
                    }
                    return null;
                  },
                ),
                TextButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const HomePage()));
                    }
                  },
                  child: const Text("Log in"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterAccount()));
                  },
                  child: const Text("Register"),
                )
              ],
            )
          )
        )
    );
  }
}

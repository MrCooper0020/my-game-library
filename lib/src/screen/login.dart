import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_city/src/screen/home.dart';
import 'package:my_city/src/screen/register_account.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{}

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _loginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final LoginController c = Get.put(LoginController());

  void showNotification(context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message)
      ),
    );
  }

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
                  obscureText: true,
                  enableSuggestions: false,
                  autocorrect: false,
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
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      try {
                        FirebaseAuth.instance.signInWithEmailAndPassword(
                            email: _loginController.text,
                            password: _passwordController.text
                        ).then((response) {
                          final localStorage = GetStorage();

                          localStorage.write('logged_user_email', _loginController.text);
                          Get.offAll(HomePage(), binding: HomePageBinding());
                        }).catchError((error) {
                          showNotification(context, "User not exist or password is wrong!");
                        });
                      } on FirebaseAuthException catch (e) {
                        if (e.code == 'weak-password') {
                          showNotification(context, 'The password provided is too weak.');
                        } else if (e.code == 'email-already-in-use') {
                          showNotification(context, 'The account already exists for that email.');
                        }
                      } catch (e) {
                        showNotification(context, "Something wrong happened!");
                      }
                    }
                  },
                  child: const Text("Log in"),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(RegisterAccount());
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

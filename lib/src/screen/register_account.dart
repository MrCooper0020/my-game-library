import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterAccountController extends GetxController{}

class RegisterAccount extends StatelessWidget {
  RegisterAccount({Key? key}) : super(key: key);

  final RegisterAccountController c = Get.put(RegisterAccountController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  void showNotification(context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Register a new account'),
            ),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "First name",
                              labelText: "First name"
                          ),
                          controller: _firstNameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, first name is required!';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Last name",
                              labelText: "Last name"
                          ),
                          controller: _lastnameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, last name is required!';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Email",
                              labelText: "Email"
                          ),
                          controller: _emailController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, email is required!';
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
                              return 'Please, password is required!';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          obscureText: true,
                          enableSuggestions: false,
                          autocorrect: false,
                          decoration: const InputDecoration(
                              hintText: "Confirm password",
                              labelText: "Confirm password"
                          ),
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, confirm password is required!';
                            } else {
                              if(value != _passwordController.text){
                                return 'Confirm password have to the same as password';
                              }
                            }

                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                try {
                                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: _emailController.text,
                                    password: (_passwordController.text).toString(),
                                  ).then((response){
                                    final localStorage = GetStorage();
                                    final userEmail = localStorage.read('logged_user_email');

                                    // Save additional data about new account
                                    FirebaseFirestore.instance.collection("additional-data-$userEmail").add({
                                      "firstName": _firstNameController.text,
                                      "lastName": _lastnameController.text
                                    }).then((DocumentReference doc) => Get.offAll(Login()));
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
                            child: const Text('Create account'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextButton(
                            onPressed: () {
                              Get.offAll(Login());
                            },
                            child: const Text('Cancel'),
                          ),
                        ),
                      ],
                    ),
                  )
                )
            )
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
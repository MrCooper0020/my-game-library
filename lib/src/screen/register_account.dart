import 'package:flutter/material.dart';
import 'login.dart';

class RegisterAccount extends StatelessWidget {
  RegisterAccount({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

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
                          decoration: const InputDecoration(
                              hintText: "Password",
                              labelText: "Password"
                          ),
                          controller: _passwordController,
                          validator: (value) {
                            if (value!.isEmpty || int.parse(value) <= 1800 || value.length != 4) {
                              return 'Please, password is required!';
                            }
                            return null;
                          },
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Confirm password",
                              labelText: "Confirm password"
                          ),
                          controller: _confirmPasswordController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please, confirm password is required!';
                            } else {
                              if(value != _passwordController.value){
                                return 'Confirm password have to the same as password';
                              }
                            }

                            return null;
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextButton(
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                // TODO: save account in firebase
                              }
                            },
                            child: const Text('Create account'),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login()));
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
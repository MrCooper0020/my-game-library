import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../data/model/game.dart';

class RegisterGameController extends GetxController{}

class RegisterGame extends StatelessWidget {
  RegisterGame({Key? key}) : super(key: key);

  final RegisterGameController c = Get.put(RegisterGameController());

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            title: const Text('Register new game'),
          ),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Title",
                            labelText: "Title"
                        ),
                        controller: _titleController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, insert a game title';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Description",
                            labelText: "Description"
                        ),
                        controller: _descriptionController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, insert a game description';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Rating",
                            labelText: "Rating"
                        ),
                        controller: _ratingController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, insert a number';
                          } else if (int.parse(value) < 0 && int.parse(value) > 10 ) {
                            return 'Rating have to be minimum 1 and maximum 10';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Year",
                            labelText: "year"
                        ),
                        controller: _yearController,
                        validator: (value) {
                          if (value!.isEmpty || int.parse(value) <= 1800 || value.length != 4) {
                            return 'Please, insert a valid year';
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                            hintText: "Image link",
                            labelText: "Image link"
                        ),
                        controller: _imageController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please, insert a valid image link';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Game game = Game(
                                  _titleController.text,
                                  _descriptionController.text,
                                  int.parse(_ratingController.text),
                                  int.parse(_yearController.text),
                                  _imageController.text
                              );
                              final localStorage = GetStorage();
                              final userEmail = localStorage.read('logged_user_email');

                              // create a unique game collection for each user
                              FirebaseFirestore.instance.collection("games-$userEmail").add({
                                "title": _titleController.text,
                                "description": _descriptionController.text,
                                "image_link": _imageController.text,
                                "user_rating": int.parse(_ratingController.text),
                                "year": int.parse(_yearController.text)
                              }).then((DocumentReference doc) =>
                                  //Get.back();
                                  Navigator.pop(context, game)
                              );
                            }
                          },
                          child: const Text('Save'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pop(context, null);
                          },
                          child: const Text('Cancel'),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          )
        );
  }
}

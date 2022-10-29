import 'package:flutter/material.dart';

import '../data/model/game.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Register new game'),
          ),
          body: Padding(
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
                            Navigator.pop(context, game);
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
          )
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

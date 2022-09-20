import 'package:flutter/material.dart';

import '../data/model/game.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

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
                          return 'title_input_empty_warning';
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
                          return 'description_input_empty_warning';
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
                          return 'rating_input_empty_warning';
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
                        if (value!.isEmpty) {
                          return 'year_input_empty_warning';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Game game = Game(
                                _titleController.text,
                                _descriptionController.text,
                                int.parse(_ratingController.text),
                                int.parse(_yearController.text)
                            );
                            Navigator.pop(context, game);
                          }
                        },
                        child: const Text('Save'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: RaisedButton(
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

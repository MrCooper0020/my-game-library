import 'package:flutter/material.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(0),
          child: Scaffold(
            body: Center(
              child: Image.network('https://hardcore-gamer.s3.amazonaws.com/uploads/2015/04/the-last-of-us-box-art.jpg'),
            ),
            floatingActionButton: FloatingActionButton(
              mini: true,
              onPressed: () {
                // Add your onPressed code here!
              },
              backgroundColor: Colors.red,
              child: const Icon(Icons.favorite_border),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          )
        ),
        Container(
            padding: const EdgeInsets.all(0),
            child: Scaffold(
              body: Center(
                child: Image.network('https://hardcore-gamer.s3.amazonaws.com/uploads/2015/04/the-last-of-us-box-art.jpg'),
              ),
              floatingActionButton: FloatingActionButton(
                mini: true,
                onPressed: () {
                  // Add your onPressed code here!
                },
                backgroundColor: Colors.red,
                child: const Icon(Icons.favorite_border),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            )
        ),
      ],
    );
  }
}

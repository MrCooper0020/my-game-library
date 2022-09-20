import 'package:flutter/material.dart';
import '../data/model/game.dart';

class GameDetails extends StatelessWidget {
  final Game game;
  const GameDetails({Key? key, required this.game}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: Text(game.title),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: <Widget>[
                Text('Description: ' + game.description),
                Text('Release: ' + game.year.toString()),
                Text('Rating: ' + game.rating.toString())
              ],
            ),
          )
        )
      )
    );
  }
}

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
            padding: const EdgeInsets.all(0),
            child: Column(
              children: <Widget>[
                Image.network('https://wallpaper.dog/large/20492255.jpg'),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Description: ${game.description}'),
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Release: ${game.year}')
                ),
                Padding(
                    padding: const EdgeInsets.all(10),
                    child: Text('Rating: ${game.rating}/10'),
                )
              ],
            ),
          )
        )
      )
    );
  }
}

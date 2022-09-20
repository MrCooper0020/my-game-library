import 'package:flutter/material.dart';
import 'package:my_city/src/screen/game_details.dart';
import '../data/database/app_database.dart';
import '../data/model/game.dart';

Widget getGamesList(Game game, dynamic context, dynamic setState) {
  return Card(
    child: ListTile(
      leading: const Icon(Icons.videogame_asset),
      title: Text(game.title),
      subtitle: Text(game.description),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => GameDetails(game: game)));
      },
      trailing: TextButton(
        onPressed: () async {
          final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

          var gameDao = database.gameDao;
          gameDao.deleteGame(game);

          setState(() {});
        },
        child: const Text('Delete'),
      ),
    ),
  );
}
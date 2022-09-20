import 'package:flutter/material.dart';
import 'package:my_city/src/screen/register.dart';
import 'package:my_city/src/widget/library_list.dart';

import '../data/database/app_database.dart';
import '../data/model/game.dart';
import '../data/dao/game_dao.dart';

class MyLibrary extends StatefulWidget {
  @override
  _MyLibraryState createState() => _MyLibraryState();
}

class _MyLibraryState extends State<MyLibrary> {

  GameDao? gameDao;
  List<Game> games = [];

  loadDB() async{
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    gameDao = database.gameDao;
    games = await gameDao?.findAll() ?? [];

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadDB();
  }

  @override
  Widget build(BuildContext context) {

    loadDB(); // to make delete button works

    void _registerNewGame(){
      Future registerResponse = Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Register()),
      );

      registerResponse.then((game) async {
        if(game != null) {
          final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

          gameDao = database.gameDao;
          gameDao?.insertGame(game);

          setState(()  {
            games.add(game);
          });
        }
      });
    }

    return Scaffold(
      body: Scaffold(
        body: ListView(
          children: games.where((game) => true).map((game) => getGamesList(game, context, setState)).toList()
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _registerNewGame,
        tooltip: 'tooltip_text',
        child: const Icon(Icons.library_add),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:my_city/src/screen/game_details.dart';
import '../data/database/app_database.dart';
import '../data/model/game.dart';

Widget getGamesList(Game game, dynamic context, dynamic setState) {

  final localStorage = GetStorage();
  final userEmail = localStorage.read('logged_user_email');

  void deleteGame(id) {
    FirebaseFirestore.instance.collection("games-$userEmail").doc(id).delete();
  }

  void getGameDataFromFireStore(String gameTitle) {
    FirebaseFirestore.instance.collection("games-$userEmail").where('title', isEqualTo: gameTitle).get().then((QuerySnapshot querySnapshot) {
      final allGames = querySnapshot.docs.map((doc) => doc.data()).toList();
      print(querySnapshot);

      for(var i = 0; i < allGames.length; i++){
        dynamic game = allGames[i];

        if(game['title'] == gameTitle){
          deleteGame(game['id']);
        }
      }
    });
  }

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

          //getGameDataFromFireStore(game.title);

          setState(() {});
        },
        child: const Text('Delete'),
      ),
    ),
  );
}
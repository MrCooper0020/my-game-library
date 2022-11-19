import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:my_city/src/screen/game_details.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../data/dao/game_dao.dart';
import '../data/database/app_database.dart';
import '../data/model/game.dart';

class StartController extends GetxController{
  RxList<Widget> gamesRecommendation = <Widget>[].obs;
  GameDao? gameDao;

  void registerNewGame(Game game) async {
    final database = await $FloorAppDatabase.databaseBuilder('app_database.db').build();

    gameDao = database.gameDao;
    gameDao?.insertGame(game);
  }

  void showNotification(context, String message){
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text(message)
      ),
    );
  }

  void getGamesRecommendation(context){
    Map<String, String> headerParams = {
      'X-RapidAPI-Key': '0144ec75c8mshb800159916ce5cap10216ajsn151e8d5dda9c',
      'X-RapidAPI-Host': 'opencritic-api.p.rapidapi.com'
    };
    var url = Uri.https('opencritic-api.p.rapidapi.com', '/game');

    http.get(url, headers: headerParams).then((response){
      var games = convert.jsonDecode(response.body);

      for(var i = 0; i < games.length; i ++){
        Game newGame = Game(games[i]["name"], games[i]["name"], (games[i]["topCriticScore"] % 10).round(), DateTime.parse(games[i]["firstReleaseDate"]).year, "https://img.opencritic.com/" + games[i]["images"]["banner"]["sm"]);

        gamesRecommendation.add(
            GestureDetector(
                child: Scaffold(
                  body: Center(
                    child: Image.network(newGame.image),
                  ),
                  floatingActionButton: FloatingActionButton(
                    heroTag: newGame.title,
                    mini: true,
                    onPressed: () {
                      final localStorage = GetStorage();
                      final userEmail = localStorage.read('logged_user_email');

                      // create a unique game collection for each user
                      FirebaseFirestore.instance.collection("games-$userEmail").add({
                        "title": newGame.title,
                        "description": newGame.description,
                        "image_link": newGame.image,
                        "user_rating": newGame.rating,
                        "year": newGame.year
                      }).then((DocumentReference doc) {
                        registerNewGame(newGame); // add to sqlite data base
                        showNotification(context, "Game added in your library");
                      });
                    },
                    backgroundColor: Colors.red,
                    child: const Icon(Icons.favorite),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
                ),
                onTap: () {
                  Get.to(GameDetails(game: newGame));
                }
            )
        );
      }
    });
  }
}

class Start extends StatelessWidget  {
  final controller = Get.put(StartController());

  @override
  Widget build(BuildContext context) {

    controller.getGamesRecommendation(context);

    return Obx(() => GridView.count(
      primary: false,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      crossAxisCount: 2,
      children: controller.gamesRecommendation.toList(),
    ));
  }
}

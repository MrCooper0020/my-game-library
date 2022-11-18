import 'package:flutter/material.dart';
import '../data/model/game.dart';
import 'package:get/get.dart';

class GameDetailsController extends GetxController{}

class GameDetails extends StatelessWidget {
  final Game game;
  GameDetails({Key? key, required this.game}) : super(key: key);
  static const noImageLink = "https://media.istockphoto.com/vectors/default-image-icon-vector-missing-picture-page-for-website-design-or-vector-id1357365823?k=20&m=1357365823&s=612x612&w=0&h=ZH0MQpeUoSHM3G2AWzc8KkGYRg4uP_kuu0Za8GFxdFc=";
  final GameDetailsController c = Get.put(GameDetailsController());

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
                Image.network(
                  game.image,
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return Image.network(noImageLink);
                  }
                ),
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

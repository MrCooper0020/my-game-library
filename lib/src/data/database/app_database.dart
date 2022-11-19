import 'dart:async';
import 'package:floor/floor.dart';
import 'package:my_city/src/data/dao/game_dao.dart';
import 'package:my_city/src/data/model/game.dart';
import 'package:my_city/src/data/dao/user_dao.dart';
import 'package:my_city/src/data/model/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [Game, User])
abstract class AppDatabase extends FloorDatabase {
  GameDao get gameDao;
}

// To delete database file
// await sqfliteDatabaseFactory.deleteDatabase(name!)
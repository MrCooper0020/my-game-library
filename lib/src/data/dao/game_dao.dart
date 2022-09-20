import 'package:floor/floor.dart';
import '../model/game.dart';

@dao
abstract class GameDao {

  @Query('SELECT * FROM game')
  Future<List<Game>> findAll();

  @insert
  Future<int> insertGame(Game game);

  @delete
  Future<int> deleteGame(Game game);

}
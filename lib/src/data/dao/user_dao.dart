import 'package:floor/floor.dart';
import '../model/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM user')
  Future<List<User>> findAll();

  @insert
  Future<int> insertBook(User user);

  @delete
  Future<int> deleteBook(User user);
}

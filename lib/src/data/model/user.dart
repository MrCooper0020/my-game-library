import 'package:floor/floor.dart';

@entity
class User {

  @PrimaryKey(autoGenerate: true)
  int? id;

  final String name;

  User(this.name, {this.id});

}
import 'dart:core';
import 'package:floor/floor.dart';

@entity
class Game {
  @PrimaryKey(autoGenerate: true)
  int? id;

  final String title;
  final String description;
  final int rating;
  final int year;

  Game(this.title, this.description, this.rating, this.year, {this.id});
}
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
  final String image;

  Game(this.title, this.description, this.rating, this.year, this.image, {this.id});
}
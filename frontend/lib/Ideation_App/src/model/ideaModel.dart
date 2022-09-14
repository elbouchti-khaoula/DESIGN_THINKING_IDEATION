import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'ideaModel.g.dart';

//flutter pub run build_runner build
@JsonSerializable()
class IdeaModel {
  String title;
  String idProject;
  String username;
  int number;
  String description;
  IdeaModel(
      {required this.title,
      required this.idProject,
      required this.username,
      required this.number,
      required this.description});

  factory IdeaModel.fromJson(Map<String, dynamic> json) =>
      _$IdeaModelFromJson(json);

  Map<String, dynamic> toJson() => _$IdeaModelToJson(this);
  //Category(this.title);
}

class Category {
  String title;

  Category(this.title);
}
/*
List<Category> categoryItems = [
  Category("Pertinante"),
  Category("Bonne idée"),
  Category("moyenne"),
  Category("non valide"),
];
*/
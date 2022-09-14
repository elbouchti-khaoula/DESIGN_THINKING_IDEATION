import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
part 'categoryModel.g.dart';
//flutter pub run build_runner build
@JsonSerializable()
class CategoryModel{
  String title;
  CategoryModel({required this.title});

  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  //Category(this.title);
}




class Category{
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
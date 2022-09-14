import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'session.g.dart';

@JsonSerializable()
class SessionModel {
  String id;
  String title;
  String description;

  SessionModel(
      {required this.id, required this.title, required this.description});

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}


// factory Album.fromJson(Map<String, dynamic> json) {
//     return Album(
//       userId: json['userId'],
//       id: json['id'],
//       title: json['title'],
// SessionModel(
//       title: json['title'],
//      descrption: json['descrption']
//      );
//     );

// factory SessionModel.fromJson(Map<String, dynamic> json) 
//   => $SessionModelFromJson(json) ;

//   Map<String,dynamic> toJson() => $SessionModelToJson(this);

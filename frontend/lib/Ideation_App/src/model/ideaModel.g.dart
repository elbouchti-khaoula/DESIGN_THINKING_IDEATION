// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ideaModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdeaModel _$IdeaModelFromJson(Map<String, dynamic> json) => IdeaModel(
      title: json['title'] as String,
      idProject: json['idProject'] as String,
      username: json['username'] as String,
      number: json['number'] as int,
      description: json['description'] as String,
    );

Map<String, dynamic> _$IdeaModelToJson(IdeaModel instance) => <String, dynamic>{
      'title': instance.title,
      'username': instance.username,
      'number': instance.number,
      'description': instance.description,
    };

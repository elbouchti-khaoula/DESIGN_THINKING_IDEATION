import 'dart:ui';

import 'package:flutter/material.dart';

class  IdeaTag {
  Color? color;
  String? tag;

  IdeaTag(this.color, this.tag);
}

class Idea{
  List<IdeaTag>? tags;
  String? title;
  String? subtitle;
  String? number;

  Idea({this.tags, this.title, this.subtitle, this.number});
}

List<Idea> backlogTaskItems = [
  Idea(
      tags: [
        IdeaTag(Colors.black54, "2 Sub idea"),
      ],
      title: "Design Wireframe",
      subtitle: "Making Wireframe to define and plan the information hierarchy ...",
      number: " 5"),
  Idea(
      tags: [
        IdeaTag(Colors.black54, "2 Sub Idea"),
      ],
      title: "Design Wireframe",
      subtitle: "Making Wireframe to define and plan the information hierarchy ...",
      number: "4"),
  Idea(
      tags: [
        IdeaTag(Colors.black54, "2 Sub Idea"),
      ],
      title: "Design Wireframe",
      subtitle: "Making Wireframe to define and plan the information hierarchy ...",
      number: "3")
];

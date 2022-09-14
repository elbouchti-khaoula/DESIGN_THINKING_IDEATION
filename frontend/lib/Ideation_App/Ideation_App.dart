import 'package:flutter/material.dart';
import 'src/ui/ideation_main_page.dart';

class IdeationApp extends StatefulWidget {
  const IdeationApp({Key? key}) : super(key: key);

  @override
  State<IdeationApp> createState() => _IdeationAppState();
}

class _IdeationAppState extends State<IdeationApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home:First(),
      home:IdeationMainPage(),

    );
  }
}


import 'package:flutter/material.dart';

import 'src/ui/ideation_main_page.dart';
import 'src/ui/add_idea.dart';
import 'src/ui/show_by_category.dart';
import 'src/ui/show_alll.dart';
import 'src/ui/create_session.dart';
import 'src/ui/modify_by_manager.dart';
import 'src/ui/modify_by_member.dart';
import 'src/ui/add_category.dart';

class CreateSessionApp extends StatelessWidget {
  const CreateSessionApp({Key? key}) : super(key: key);
  /*const Padding(
  padding: EdgeInsets.only(right: 12),
  child: CircleAvatar(
  radius: 20,
  backgroundColor: Color(0x55668DED),
  child: Icon(
  Icons.add,
  color: Color(0xff4071e9),
  size: 32,
  ),
  ),
  ),*/
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: IdeationMainPage(),
      //home: CreateSessionPage(),
      //home: ShowByCategoryPage(),
      //home: ShowAllPage(idprj: "62a3709bd6dd9b2960547d41"),
      //home: ModifyByManagerPage(),
      //home: ModifyByMemberPage(),
      //home: AddIdeaPage(),
      //home:AddCategoryPage(),
    );
  }
}

import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projet_pfa/Ideation_App/src/model/idea.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/category_controller.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/choice_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projet_pfa/Ideation_App/src/ui/add_idea.dart';
import 'package:http/http.dart' as http;
import 'package:projet_pfa/Ideation_App/src/ui/ideation_main_page.dart';
import 'package:projet_pfa/Ideation_App/src/ui/modify_by_member.dart';
import 'package:projet_pfa/Ideation_App/src/ui/sessionpage.dart';
import 'package:projet_pfa/Ideation_App/src/ui/show_alll.dart';

import '../model/categoryModel.dart';
import '/NetworkHandler.dart';
import '../model/choice.dart';

class ShowByCategoryPage extends StatefulWidget {
  final idprj;
  ShowByCategoryPage({required this.idprj});
  @override
  _ShowByCategoryPageState createState() => _ShowByCategoryPageState();
}

class _ShowByCategoryPageState extends State<ShowByCategoryPage> {
  @override
  List idees = [];
  List categorie = [];
  NetworkHandler networkhandler = NetworkHandler();
  NetworkHandler networkhandler2 = NetworkHandler();
  int currentState = 2;
  void initState() {
    super.initState();
    fetchIdee();
    fetchCategory();
  }

  void fetchIdee() async {
    var response =
        await networkhandler.get("/idee/getAllIdee/${widget.idprj["_id"]}");
    setState(() {
      idees = response["data"];

      print(idees);
    });
  }

  //fetch sessions data
  void fetchCategory() async {
    var response = await networkhandler2.get("/categorie/getCategory");
    setState(() {
      categorie = response["data"];
      print("data d cat");
      print(categorie);
    });
  }

  Future deleteIdee(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:5000/idee/deleteIdee/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    return jsonDecode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromRGBO(3, 4, 94, 1),
        shape: CircularNotchedRectangle(),
        notchMargin: 12,
        child: Container(
          height: 60,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  color: currentState == 0 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 0;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IdeationMainPage()));
                    });
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.details),
                  color: currentState == 1 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SessionPage(
                                session: widget.idprj,
                              )));
                    });
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.lightbulb_circle_outlined),
                  color: currentState == 2 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 2;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              ShowAllPage(idprj: widget.idprj)));
                    });
                  },
                  iconSize: 40,
                ),
                IconButton(
                  icon: Icon(Icons.card_giftcard_outlined),
                  color: currentState == 3 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 3;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => IdeationMainPage()));
                    });
                  },
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back)),
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: Text("Show all"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(width: 85),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => ShowAllPage(
                                                  idprj: widget.idprj,
                                                )));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Show All",
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 15),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xffDBEBF6),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              SizedBox(width: 20),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ShowByCategoryPage(
                                                    idprj: widget.idprj)));
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Show by category",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color(0xff388FC0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      //padding: const EdgeInsets.all(8.0),
                      padding:
                          const EdgeInsets.only(left: 16, top: 40, bottom: 4),
                      child: Row(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Icon(Icons.add, color: Colors.white),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Add Category",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 15),
                                  ),
                                ),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(3, 4, 94, 1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Container(
                          height: 48,
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                  right: 8,
                                  top: 4,
                                  bottom: 4,
                                ),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                      borderRadius: BorderRadius.circular(90),
                                    ),
                                    child: Center(
                                      child: Text(
                                        categorie[index]["title"],
                                        //categoryItems[index].title,
                                        style: TextStyle(
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                            //itemCount: categoryItems.length,
                            itemCount: categorie.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: idees.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = idees[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: SizedBox(
                              height: 200,
                              child: Card(
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 7),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.grey[300],
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                padding:
                                                    const EdgeInsets.all(6),
                                                child: SizedBox(
                                                  height: 25,
                                                  width: 25,
                                                  child: IconButton(
                                                    padding: EdgeInsets.zero,
                                                    iconSize: 20,
                                                    icon: Icon(Icons.edit,
                                                        color: Color.fromRGBO(
                                                            3, 4, 94, 1)),
                                                    onPressed: () {
                                                      Navigator.of(context).push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              ModifyByMemberPage(
                                                                  idprj: widget
                                                                          .idprj[
                                                                      "_id"])));
                                                    },
                                                  ),
                                                ),
                                              )),
                                          const Spacer(),
                                          Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(8),
                                            ),
                                            padding: const EdgeInsets.all(6),
                                            child: SizedBox(
                                              height: 25,
                                              width: 25,
                                              child: IconButton(
                                                padding: EdgeInsets.zero,
                                                iconSize: 20,
                                                icon: Icon(Icons.delete,
                                                    color: Color.fromRGBO(
                                                        3, 4, 94, 1)),
                                                onPressed: () {
                                                  deleteIdee(
                                                    idees[index]["_id"],
                                                  );
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ShowAllPage(
                                                                idprj: widget
                                                                    .idprj,
                                                              )));
                                                },
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 16),
                                        child: Text(idees[index]["title"],
                                            style: TextStyle(
                                                color: Color.fromRGBO(
                                                    3, 4, 94, 1))),
                                      ),
                                      Text(idees[index]["description"]),
                                      const SizedBox(
                                        height: 16,
                                      ),
                                      Row(
                                        children: [
                                          Text(idees[index]["username"],
                                              style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      3, 4, 94, 1))),
                                          const Spacer(),
                                          const SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            "${idees[index]["number"]} ène idée",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 12,
                                            ),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

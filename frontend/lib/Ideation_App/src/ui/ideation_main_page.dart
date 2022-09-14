import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projet_pfa/Ideation_App/src/model/session.dart';
import 'package:projet_pfa/Ideation_App/src/ui/create_session.dart';
import 'package:projet_pfa/Ideation_App/src/ui/meeting_page.dart';
import 'package:projet_pfa/Ideation_App/src/ui/sessionpage.dart';
import 'package:http/http.dart' as http;
import 'package:projet_pfa/NetworkHandler.dart';

class IdeationMainPage extends StatefulWidget {
  const IdeationMainPage({Key? key}) : super(key: key);

  @override
  State<IdeationMainPage> createState() => _IdeationMainPageState();
}

class _IdeationMainPageState extends State<IdeationMainPage> {
  @override
  List sessions = [];
  NetworkHandler networkhandler = NetworkHandler();
  int currentState = 0;

  void initState() {
    super.initState();
    fetchSession();
  }

  //fetch sessions data
  void fetchSession() async {
    var response = await networkhandler.get("/session/getAllSession");
    setState(() {
      sessions = response["data"];
    });
  }

  Future deleteSession(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('http://10.0.2.2:5000/session/deleteSession/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return jsonDecode(response.body);
  }

  Widget build(BuildContext context) {
    var assetsImage = new AssetImage(
        'assets/images/img.jpg'); //<- Creates an object that fetches an image.
    //var imag = new Image(image: assetsImage, fit: BoxFit.cover); //<- Creates a widget that displays an image.

    return Scaffold(
      //Flutter AppBar The Scaffold widget is the base of the screen for a single page.
      backgroundColor: Colors.grey[100],
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        leading: GestureDetector(child: Icon(Icons.arrow_back)),
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: Text("Ideation"),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => CreateSessionPage()));
        },
        child: Text(
          "+",
          style: TextStyle(fontSize: 40),
        ),
      ),
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
                  icon: Icon(Icons.meeting_room),
                  color: currentState == 1 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MeetingPage()));
                    });
                  },
                  iconSize: 40,
                )
              ],
            ),
          ),
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 145),
              child: Row(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff85B6D1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        "ideation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        "Projects",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16, 0, 0, 8),
                      child: SizedBox(
                        height: 270,
                        // decoration: const BoxDecoration(
                        //   color: Colors.green,
                        // ),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: sessions.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SessionPage(
                                            session: sessions[index])));
                                // Navigator.of(context).push(MaterialPageRoute(
                                //     builder: (context) => MeetingPage()));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 8),
                                child: SizedBox(
                                  width: 180,
                                  child: Card(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image: assetsImage,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                          Text(
                                            sessions[index]["title"],
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 16,
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: Text(
                                                  sessions[index]
                                                      ["description"],
                                                  style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ),
                                              Spacer(),
                                              InkWell(
                                                  onTap: () {
                                                    deleteSession(
                                                        sessions[index]["_id"]);
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                IdeationMainPage()));
                                                  },
                                                  child: Icon(Icons.delete))
                                            ],
                                          ),
                                          const SizedBox(
                                            height: 8,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

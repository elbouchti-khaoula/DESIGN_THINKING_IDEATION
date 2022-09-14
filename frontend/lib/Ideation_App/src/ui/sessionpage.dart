import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:projet_pfa/Ideation_App/src/model/session.dart';
import 'package:projet_pfa/Ideation_App/src/ui/ideation_main_page.dart';
import 'package:projet_pfa/Ideation_App/src/ui/show_alll.dart';

class SessionPage extends StatefulWidget {
  //const SessionPage({Key? key, required this.session}) : super(key: key);
  final session;
  SessionPage({required this.session});

  @override
  State<SessionPage> createState() => _SessionPageState();
}

class _SessionPageState extends State<SessionPage> {
  @override
  Widget build(BuildContext context) {
    int currentState = 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: Center(child: Text("Session details")),
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
                  icon: Icon(Icons.details),
                  color: currentState == 1 ? Colors.white : Colors.white54,
                  onPressed: () {
                    setState(() {
                      currentState = 1;
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SessionPage(
                                session: widget.session,
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
                              ShowAllPage(idprj: widget.session)));
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
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(
              height: 90,
            ),
            Center(
              child: Row(children: [
                SizedBox(
                  width: 110,
                ),
                Icon(Icons.title, color: const Color.fromRGBO(3, 4, 94, 1)),
                SizedBox(width: 10),
                Text(
                  widget.session["title"],
                  style: TextStyle(fontSize: 20),
                )
              ]),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ShowAllPage(
                              idprj: widget.session,
                            )));
              },
              child: Icon(Icons.abc),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Center(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  height: 100,
                  width: 350,
                  child: Column(
                    children: [
                      Row(children: [
                        Icon(Icons.description_outlined,
                            color: const Color.fromRGBO(3, 4, 94, 1)),
                        SizedBox(width: 10),
                        Text(
                          "Description",
                          style: TextStyle(fontSize: 20),
                        )
                      ]),
                      SizedBox(height: 20),
                      Text(widget.session["description"])
                    ],
                  ),
                ),
              ),
            )
          ])),
    );
  }
}

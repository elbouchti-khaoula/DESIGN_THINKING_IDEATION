import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projet_pfa/Ideation_App/src/ui/ideation_main_page.dart';
import 'package:projet_pfa/NetworkHandler.dart';

class CreateSessionPage extends StatefulWidget {
  const CreateSessionPage({Key? key}) : super(key: key);

  @override
  State<CreateSessionPage> createState() => _CreateSessionPageState();
}

class _CreateSessionPageState extends State<CreateSessionPage> {
  /*final List<String> _tagItems = [
    "UI/UX",
    "design",
    "presentation",
    "work",
    "figma",
    "web",
    "demo",
  ];*/
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descrController = TextEditingController();
  NetworkHandler networkHandler = NetworkHandler();

  @override
  Widget build(BuildContext context) {
    String dateToday = DateTime.now().toString();
    String date = dateToday.toString().substring(0, 10);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: Text("Ideation"),
        centerTitle: true,
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Create New session",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "Title",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: _descrController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "Description",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "Date ",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    Row(
                      children: [
                        Icon(Icons.date_range),
                        Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Today's Date",
                                style: TextStyle(color: Colors.blueGrey),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "$date",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 120,
              child: Padding(
                //padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Members",
                      style: TextStyle(color: Colors.blueGrey),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return const Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: CircleAvatar(
                                radius: 32,
                                backgroundColor: Color(0x55668DED),
                                child: Icon(
                                  Icons.add,
                                  color: Color(0xff4071e9),
                                  size: 32,
                                ),
                              ),
                            );
                          }
                          return const Padding(
                            padding: EdgeInsets.only(right: 12),
                            child: CircleAvatar(
                              radius: 32,
                              backgroundImage: NetworkImage(
                                  "https://thispersondoesnotexist.com/image"),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 160, top: 70, bottom: 30),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                Map<String, String> data = {
                                  "title": _titleController.text,
                                  "description": _descrController.text
                                };

                                print(data);
                                await networkHandler.post(
                                    "/session/AddSession", data);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            IdeationMainPage()));
                              },
                              child: Text(
                                "Done",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xffDBEBF6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

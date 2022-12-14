import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projet_pfa/Ideation_App/src/model/idea.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/category_controller.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/choice_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projet_pfa/Ideation_App/src/ui/show_alll.dart';

import '../model/categoryModel.dart';

import '../model/choice.dart';

import '/NetworkHandler.dart';
import '../model/categoryModel.dart';

NetworkHandler networkHandler = NetworkHandler();

class AddIdeaPage extends StatefulWidget {
  final idprj;
  AddIdeaPage({required this.idprj});

  @override
  State<AddIdeaPage> createState() => _AddIdeaPageState();
}

class _AddIdeaPageState extends State<AddIdeaPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: Text(""),
        centerTitle: true,
      ),
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
                    "Add",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const Text(
                    "Idea By member ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "Id??e",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                  TextField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "Description",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "username",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                  TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText:
                            "Is it your first idea? tap the number of this one",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                ],
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
                        padding: const EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 100.0,
                          height: 80.0,
                          child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xff87C7EB),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              child: new Text('Done'),
                              //onPressed: _onButtonPressed ,
                              onPressed: () async {
                                Map<String, String> data = {
                                  "title": _titleController.text,
                                  "idProject": widget.idprj["_id"],
                                  "description": _descriptionController.text,
                                  "username": _usernameController.text,
                                  "number": _numberController.text,
                                };
                                print(data);
                                await networkHandler.post(
                                    "/idee/AddIdee", data);
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ShowAllPage(
                                              idprj: widget.idprj,
                                            )));
                                //await networkHandler.get("/categorie/getCategory");
                              }),
                        ),
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

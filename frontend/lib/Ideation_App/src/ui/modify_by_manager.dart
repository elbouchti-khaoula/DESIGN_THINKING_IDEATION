import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projet_pfa/Ideation_App/src/model/idea.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/category_controller.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/choice_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projet_pfa/Ideation_App/src/ui/add_category.dart';
import 'package:projet_pfa/Ideation_App/src/ui/show_by_category.dart';

import '../model/categoryModel.dart';
import '/NetworkHandler.dart';
import '../model/choice.dart';

NetworkHandler networkHandler = NetworkHandler();

class ModifyByManagerPage extends StatefulWidget {
  final idprj;
  ModifyByManagerPage({required this.idprj});

  @override
  State<ModifyByManagerPage> createState() => _ModifyByManagerPageState();
}

class _ModifyByManagerPageState extends State<ModifyByManagerPage> {
  List categories = [];
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();

//CategoryModel categorymodel = CategoryModel(title: "");
  int currentState = 0;
  @override
  void initState() {
    super.initState();
    fetchCategory();
  }

  //fetch sessions data
  void fetchCategory() async {
    var response = await networkHandler.get("/categorie/getCategory");
    setState(() {
      categories = response["data"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 7),
                      child: Container(
                          decoration: BoxDecoration(
                            color: const Color(0xff87C7EB),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.all(6),
                          child: new IconButton(
                            icon: Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ShowByCategoryPage(idprj: widget.idprj)));
                            },
                          ))),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff87C7EB),
                      //color: Color(0x388FC0),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.menu, color: Colors.white),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Modify",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const Text(
                    "Idea by manager",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                        labelText: "le username du personne ayant modefi ...",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                  TextField(
                    controller: _numberController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "quelle idee? donné le numéro d...",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                  TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                        labelText: "Add Category",
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
                      height: 12,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 220,
              child: Padding(
                //padding: const EdgeInsets.only(left: 16, top: 8, bottom: 8),
                padding: const EdgeInsets.all(2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 1, top: 2, bottom: 8),
                      child: const Text(
                        "You should Select from this existing Categories",
                        style: TextStyle(color: Colors.blueGrey),
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Consumer(
                                builder: (BuildContext context, WidgetRef ref,
                                    Widget? child) {
                                  final idx = ref.watch(categoryProvider);
                                  return Container(
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
                                            onTap: () {
                                              ref
                                                  .read(
                                                      categoryProvider.notifier)
                                                  .state = index;
                                            },
                                            child: Container(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                horizontal: 16,
                                              ),
                                              decoration: BoxDecoration(
                                                color: idx == index
                                                    ? Color(0xffDBEBF6)
                                                    : Color(0xffDBEBF6),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  categories[index]["title"],
                                                  style: TextStyle(
                                                    color: idx == index
                                                        ? Colors.grey
                                                        : Colors.grey,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                      itemCount: categories.length,
                                      scrollDirection: Axis.horizontal,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 80.0,
                              height: 50.0,
                              child: TextButton(
                                  style: TextButton.styleFrom(
                                    backgroundColor: Color(0xff87C7EB),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  child: new Text('Done'),
                                  //onPressed: _onButtonPressed
                                  onPressed: () async {
                                    Map<String, String> data = {
                                      "username": _usernameController.text,
                                      "idProject": widget.idprj,
                                      "number": _numberController.text,
                                      "categorie": _categoryController.text
                                    };
                                    print(data);
                                    await networkHandler.post(
                                        "/idee/updateCategory/${_usernameController.text}/${_numberController.text}",
                                        data);
                                    await networkHandler
                                        .get("/idee/getAllIdee");
                                  }),
                            ),
                          ],
                        ),
                      ),
                    )
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

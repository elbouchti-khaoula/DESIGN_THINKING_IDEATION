import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:projet_pfa/Ideation_App/src/model/idea.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/category_controller.dart';
import 'package:projet_pfa/Ideation_App/src/riverpod/choice_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:projet_pfa/Ideation_App/src/ui/show_by_category.dart';
import '/NetworkHandler.dart';
import '../model/categoryModel.dart';

import '../model/choice.dart';

class AddCategoryPage extends StatefulWidget {
  const AddCategoryPage({Key? key}) : super(key: key);

  @override
  State<AddCategoryPage> createState() => _AddCategoryPageState();
}

class _AddCategoryPageState extends State<AddCategoryPage> {
  //final TextEditingController _titleController = TextEditingController(text: "Bonne idée");
  final TextEditingController _categoryController = TextEditingController();
  NetworkHandler networkHandler =
      NetworkHandler(); //create object of this net..
  bool circular = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // leading: GestureDetector(child: Icon(Icons.arrow_back)),
        backgroundColor: const Color.fromRGBO(3, 4, 94, 1),
        title: Text("Add a category"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
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
                    "Category By Manager ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                    ),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  TextField(
                    controller: _categoryController,
                    decoration: const InputDecoration(
                        // label: Text("Title"),
                        labelText: "Category",
                        labelStyle: TextStyle(
                          color: Colors.blueGrey,
                        )),
                  ),
                ],
              ),
            ),

            /*InkWell(
                onTap: () async {
                  
                  if (_globalkey.currentState.validate() && validate) {
                    // we will send the data to rest server
                    Map<String, String> data = {
                      "username": _usernameController.text,
                      "email": _emailController.text,
                      "password": _passwordController.text,
                    };
                    print(data);
                    var responseRegister =
                        await networkHandler.post("/user/register", data);

                    //Login Logic added here
                    if (responseRegister.statusCode == 200 ||
                        responseRegister.statusCode == 201) {
                      Map<String, String> data = {
                        "username": _usernameController.text,
                        "password": _passwordController.text,
                      };
                      var response =
                          await networkHandler.post("/user/login", data);

                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        Map<String, dynamic> output =
                            json.decode(response.body);
                        print(output["token"]);
                        await storage.write(
                            key: "token", value: output["token"]);
                        setState(() {
                          validate = true;
                          circular = false;
                        });
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (route) => false);
                      } else {
                        Scaffold.of(context).showSnackBar(
                            SnackBar(content: Text("Netwok Error")));
                      }
                    }

                    //Login Logic end here

                    setState(() {
                      circular = false;
                    });
                  } else {
                    setState(() {
                      circular = false;
                    });
                  }
                },
                child: circular
                    ? CircularProgressIndicator()
                    : Container(
                        width: 150,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff00A86B),
                        ),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
              )*/

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
                                  "title": _categoryController.text,
                                };
                                print(data);
                                await networkHandler.post(
                                    "/categorie/AddCategory", data);
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

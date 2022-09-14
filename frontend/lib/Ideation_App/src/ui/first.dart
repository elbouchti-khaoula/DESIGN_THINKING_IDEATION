import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../model/categoryModel.dart';
class First extends StatefulWidget {
  const First({Key? key}) : super(key: key);

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    //String imag= "assets//images://img"; // from assets
    var assetsImage = new AssetImage('assets/images/img.jpg'); //<- Creates an object that fetches an image.
    //var imag = new Image(image: assetsImage, fit: BoxFit.cover); //<- Creates a widget that displays an image.

    return Scaffold(//Flutter AppBar The Scaffold widget is the base of the screen for a single page.
      // It is used to implement the basic functional layout structure of an app.
      // You can easily implement functional
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: const Icon(Icons.keyboard_return_rounded),
                    ),
                  )
                  ,
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.lightBlueAccent,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.all(6),
                    child: const Icon(Icons.menu),
                  )
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 145),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Container(

                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Text(
                        "Ideation",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: SizedBox(
                                width: 180,
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius: BorderRadius.circular(8),
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
                                        const Text(
                                          "Projet 1: ",
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
                                            child:Text(
                                              "Front-End Development for an E-commerce Web site ",
                                              style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            ),

                                            Spacer(),

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
                            );
                          },
                          itemCount: 10,
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

            Padding(
              padding: const EdgeInsets.all(100),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 9),
                    child: Container(
                      child: Row(
                        children: [
                          Icon(Icons.add),
                           Text(
                            "Add Ideation Session",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),

                        ],
                      ),
                      decoration: BoxDecoration(
                        color: Colors.lightBlueAccent,
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

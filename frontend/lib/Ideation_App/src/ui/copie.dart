import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
class TaskManagementMainPage extends StatefulWidget {
  const TaskManagementMainPage({Key? key}) : super(key: key);

  @override
  State<TaskManagementMainPage> createState() => _TaskManagementMainPageState();
}

class _TaskManagementMainPageState extends State<TaskManagementMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(//Flutter AppBar The Scaffold widget is the base of the screen for a single page.
      // It is used to implement the basic functional layout structure of an app.
      // You can easily implement functional
      backgroundColor: Colors.grey[100],
      body:SafeArea(//la page commance aprés la barre télé
        child: Column(
          children:[
            Row(//Les widgets Column et Row servent à définir la disposition des autres widgets dans
              // une application Flutter. Si vous avez déjà utilisé Excel ou créé un tableau, alors c’est
              // le concept des lignes et des colonnes dans Flutter. Le widget Row est un widget utilisé
              // pour positionner horizontalement d’autres widgets.
              children: [
                CircleAvatar(),//le premier à être positionné horizontalement le reste est écrasé
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal:9), // au lieu de all(4.0), je ... espace entre le children avt at celui après cette ligne
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,//Place the children with their start edge aligned with the start side of the cross axis.
                      // For example, in a column (a flex with a vertical axis) whose TextDirection is TextDirection.ltr,
                      // this aligns the left edge of the children along the left edge of the column.
                      // If this value is used in a horizontal direction, a TextDirection must be available to determine if
                      // the start is the left or the right.If this value is used in a vertical direction,
                      // a VerticalDirection must be available to determine if the start is the top or the bottom.

                      //les glisser plus proche possible vers start item
                      children:[
                        Text("Dreamwalker"),//le premier à être positionné verticalement le reste c'est sur la lign 2
                        SizedBox(height: 4,),// espace entre les 2
                        Text("Hello, Dreamwalker",
                          style: TextStyle(
                            fontSize: 12,
                            color:Colors.grey,
                          ),

                        )
                      ]
                  ),
                ),
                Spacer(),// un espace pour que le item aprés sera à la fin de la lign
                Container(
                  decoration: BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(8)),

                  padding: EdgeInsets.all(4),
                  child:Icon(Icons.menu ,size: 40.0,
                    //,color: Colors.red,
                    //size: 50.0,
                  ),
                )
              ],
            ),
            SizedBox( height: 8,),
            Expanded(
                child: SingleChildScrollView(
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // gliss to the beginning of the page
                    children:[
                      Padding(
                        padding:const EdgeInsets.all(16.0), // tous glisser bas
                        child: Text("Project", style:TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:16
                        )),
                      ),//Container( height: 300 decoration:BoxDecoration(color:Colors.green
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 8, 0, 8) , //all(8.0), décaler from the start point(left, top , right,down)
                        child: Container(
                          height: 280,
                          //decoration:BoxDecoration(
                          //color:Colors.green,
                          // ),
                          child: ListView.builder( // les child ici sont var dc on a return de l'elmt
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context,index){
                              return Padding(
                                padding: const EdgeInsets.only(right:8),
                                child: SizedBox( // sizebox doit finir avec ; et on va ajouter pading
                                    width: 180,
                                    child:Card(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children:[
                                            Expanded(child: Container( // le container de l'app on va remplir les whiite boxws by grey ones avec arret cerculaire
                                              decoration:BoxDecoration(
                                                color:Colors.grey,
                                                borderRadius: BorderRadius.circular(8),
                                                image: DecorationImage(
                                                  image:CachedNetworkImageProvider(
                                                    "https://cdn.pixabay.com/photo/2021/12/15/12/21/leaves-6872404_960_720.jpg",
                                                  ),
                                                  fit:BoxFit.cover,
                                                ),
                                              ),
                                            ),

                                            ),
                                            Row(
                                              children: [
                                                Text("NFT Landing"),
                                                Row(
                                                  children:[
                                                    Text("4"),
                                                    Text("/12 task"),
                                                    Spacer(),
                                                    Text("30%"),
                                                  ],
                                                ),
                                                LinearPercentIndicator( // la lign afiiché aver un pourcentage
                                                  fillColor: Colors.blueAccent,
                                                  percent: 0.3,
                                                  backgroundColor:Colors.grey[300],
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                ),
                              );
                            },
                            itemCount:10,
                          ),
                        ) ,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Padding(
                        padding:const EdgeInsets.only(left:16), // espace from left
                        child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween, //espace entre les childs
                            children:[
                              const Text(
                                "My Task",
                                style:const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),

                              ),
                              TextButton(
                                onPressed: (){},
                                child:Text("See all"),
                              ),
                            ]
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left:16),
                        child: Container( // les espace
                          height: 64,
                          color:Colors.red,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView.builder(
                          itemCount: 10,// nbr des items
                          itemBuilder: (context,index){
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: SizedBox(
                                height: 200,
                                child: Card(
                                  child:Container(
                                      color:Colors.red

                                  ),
                                ),
                              ),
                            );
                          },
                          shrinkWrap: true,
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],

        ),
      ),
    );
  }
}

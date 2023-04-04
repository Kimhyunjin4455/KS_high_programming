import 'package:flutter/material.dart';
import 'package:high_final_project/main.dart';
import 'SecondPage.dart';
import 'package:high_final_project/projectPage.dart';

class ImagePage extends StatelessWidget {
  const ImagePage({Key? key}) : super(key: key);

  static List<String> projectImage =[
    'image/pokestudy1.png',
    'image/pokestudy2.png',
    'image/mobile_project1.png',
    'image/mobile_project2.png',
    'image/mobile_project3.png',
    'image/mobile_project4.png',
    'image/game_project1.png',
    'image/game_project2.png',
    'image/game_project3.png',
    'image/game_project4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Project Image',
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before_outlined),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> ProjectPage()));
            },
          ),
        ],
      ),
      body: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.all(8),
          itemCount: 10,
          itemBuilder: (context, index){
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child:  Image.asset(projectImage[index],
                  fit: BoxFit.contain,))
            );
          })
    );
  }
}

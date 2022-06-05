import 'package:flutter/material.dart';
import 'package:high_final_project/main.dart';
import 'SecondPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'ImagePage.dart';
import 'package:high_final_project/videoPage.dart';
import 'package:high_final_project/data/network.dart';
import 'package:high_final_project/data/my_location.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';


const apikey = 'ce38019494c6c346d5f2bc8c7321047b';

class ProjectPage extends StatelessWidget {
  //const ProjectPage({Key? key}) : super(key: key);

  //FirebaseFirestore fireStore = FirebaseFirestore.instance;
  //final DocumentSnapshot documentData;
  //ProjectPage(this.documentData);

  var projects_name1 = FirebaseDatabase().reference().child("projects").child('E5T6OsJbvmXW5vQ5yjte').child("name");




  double? latitude3;
  double? longitude3;

  Future<List> _getProjectList()async{
    List list = [];
    var ref = FirebaseFirestore.instance.collection('projects');
    await ref.get().then((QuerySnapshot querySnapshot) => {
      for (var doc in querySnapshot.docs) list.add(doc.data())
    });
    return list;
  }

  void getLocation2() async {
    MyLocation myLocation = MyLocation();
    await myLocation.getMyCurrentLocation();
    latitude3 = myLocation.latitude2;
    longitude3 = myLocation.longitude2;
    print(latitude3);
    print(longitude3);

    Network network = Network('https://api.openweathermap.org/data/2.5/weather'
        '?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

    var weatherData = await network.getJsonData();
    print(weatherData);

    // Navigator.push(context, MaterialPageRoute(
    //     builder: (context){
    //       return ListViewPage(parseWeatherData: weatherData);
    //     }));
  }

  var schedule1 = '2020/11~2020/22';
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[200],
        title: Text('Project'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before_outlined),
            tooltip: 'Next page',
            onPressed: () async{
              Network network = Network('https://api.openweathermap.org/data/2.5/weather'
                  '?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

              var weatherData = await network.getJsonData();
              //print(weatherData);
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>ListViewPage(parseWeatherData: weatherData)));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 540,
            child: FutureBuilder(
              future: _getProjectList(),
              builder: (BuildContext context, AsyncSnapshot snapshot){
                if(!snapshot.hasData){
                  return Center(child: CircularProgressIndicator());
                }else{
                  final _docs = snapshot.data!;
                  return ListView.builder(
                    itemCount: _docs.length,
                      itemBuilder: (BuildContext context, index){
                        return GestureDetector(
                          onTap: (){
                            debugPrint('touch');
                          },
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(25),
                              child: Column(
                                children: [
                                  Text('${_docs[index]['name']}',
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey
                                  ),),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: width,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text('${_docs[index]['schedule']}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[500]
                                            ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            '${_docs[index]['group']}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[500]
                                            ),
                                          ),
                                          SizedBox(
                                            width: 30,
                                          ),
                                          Text('${_docs[index]['sort']}',
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.grey[500]
                                            ),),
                                        ],
                                      ),
                                      ],

                                  ),
                                    ),
                                  ),
                              ],
                              ),
                            ),
                          ),
                        );
                      },);

                }
              }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 280,
            child: RaisedButton(
                color: Colors.blue[300],
                child: Text('Project image',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]
                  ),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> ImagePage()));
                }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 280,
            child: RaisedButton(
                color: Colors.blue[300],
                child: Text('poke project video',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]
                  ),),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context)=> VideoPlayerScreen()));
                }),
          )

        ],
      ),

    );
    }




  }




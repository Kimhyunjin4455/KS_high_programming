import 'package:flutter/material.dart';
import 'SecondPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:high_final_project/data/network.dart';
import 'package:high_final_project/data/my_location.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

const apikey = 'ce38019494c6c346d5f2bc8c7321047b';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage(),));
}



class MyPage extends StatefulWidget {
  //const MyPage({Key? key}) : super(key: key);

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  double? latitude3;
  double? longitude3;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLocation();

  }

  void getLocation() async {
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


  // void fetchData() async{
  //
  //     var myJson = parsingData['weather'][0]['description'];
  //     print(myJson);
  //
  //     var wind = parsingData['wind']['speed'];
  //     print(wind);
  //
  //     var id = parsingData['id'];
  //     print(id);
  //   }else{
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      appBar: AppBar(
        title: Text('2022 김현진 하계 포트폴리오',
          style: TextStyle(
              fontWeight: FontWeight.bold
          ),),
        backgroundColor: Colors.blue[200],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child:
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('image/h_project_image.jpeg'),
                    radius: 80.0,
                  ),
                  Divider(
                    height: 60.0,
                    color: Colors.grey[800],
                    thickness: 0.5,
                    endIndent: 30.0,
                  ),
                  SizedBox(
                    height: 80.0,
                  ),
                  Text('김현진/남/25',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('지치지 않고 재미와 함께하는 코딩을 지향합니다',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('현재 경성대학교 소프트웨어학과 4학년 재학중',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('종강 후 각종 프로젝트/활동 지원 예정',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                  Text('읽어주셔서 감사합니다 :)',
                    style: TextStyle(
                        color: Colors.black45,
                        letterSpacing: 2.0,
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Container(
              width: 280,
              height: 40,
              child: RaisedButton(
                  color: Colors.blue[300],
                  child: Text('Read Portfolio',
                    style: TextStyle(
                      color: Colors.black45,
                      letterSpacing: 3.0,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: ()async{
                    Network network = Network('https://api.openweathermap.org/data/2.5/weather'
                        '?lat=$latitude3&lon=$longitude3&appid=$apikey&units=metric');

                    var weatherData = await network.getJsonData();
                    //print(weatherData);
                     Navigator.push(context, MaterialPageRoute(
                         builder: (context)=>ListViewPage(parseWeatherData: weatherData)));
                  }),
            ),
            SizedBox(
              height: 50.0,
            ),
            Text('thank you',
              style: TextStyle(
                color: Colors.black45,
                letterSpacing: 2.0,
                fontSize: 15.0,

              ),
            ),

          ],
        ),
      ),
    );
  }
}



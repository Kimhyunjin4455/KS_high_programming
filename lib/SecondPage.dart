import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:high_final_project/projectPage.dart';
import 'main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/services.dart';
import 'package:high_final_project/data/network.dart';
import 'package:high_final_project/data/my_location.dart';
import 'package:firebase_auth/firebase_auth.dart';


class ListViewPage extends StatefulWidget {
  ListViewPage({this.parseWeatherData});
  final dynamic parseWeatherData;
  //const ListViewPage({Key? key}) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {

  String? cityName;
  int? temp2;

  void initState() {
    // TODO: implement initState
    super.initState();
    updateData(widget.parseWeatherData);



  }

  void updateData(dynamic weatherData){
    double temp = weatherData['main']['temp'];
    temp2 = temp.round();
    cityName = weatherData['name'];
    print(temp2);
    print(cityName);
  }

  var potList= [
    '사용언어',
    '프로젝트',
    '참여내역',
    '깃허브',
    '백준'
  ];
  var descriptionList= [
    '팝업 창이 열립니다',
    '페이지가 이동 됩니다',
    '팝업 창이 열립니다',
    '팝업 창이 열립니다',
    '팝업 창이 열립니다'
  ];


  void showPopup(context, pot, index){
    if (index ==0) {
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: 380,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 30
                  ),
                  Text('python',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200]
                      )),
                  SizedBox(
                      height: 30
                  ),
                  Text('dart',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200]
                      )),
                  SizedBox(
                      height: 30
                  ),
                  Text('c#',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200]
                      )),
                  SizedBox(
                      height: 30
                  ),
                  Text('java',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200]
                      )),
                  SizedBox(
                      height: 30
                  ),
                  Text('kotlin',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200]
                      )),
                ],
              ),
            ),
          );
        },
      );
    }else if(index==1){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>ProjectPage()));

    }else if(index==2) {
      showDialog(context: context, builder: (context) {
        return Dialog(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 30
                  ),
                  Text('<참여내역>',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue[200]
                      )),
                  SizedBox(
                      height: 60
                  ),
                  Text('       1. 코드잇 대학생\n비대면 코딩캠프 9기 수료',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
                      )),
                  SizedBox(
                      height: 40
                  ),
                  Text('   2. 코드어스 0기\n 알고리즘 활동 리더',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black45
                      )),
                ],
              ),
            )
        );
      });
    }else if(index==3){
      showDialog(context: context, builder: (context) {
        return Dialog(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 20
                  ),
                    Center(
                      child: TextButton(
                        child: Text('github',
                        style: TextStyle(
                          fontSize: 30
                        ) ,
                        ),
                        onPressed: (){
                          Uri url = Uri.parse('https://github.com/Kimhyunjin4455');
                          launchUrl(url);
                          }
                      ),
                    ),
                ],
              ),
            )
        );
      });
    }else if(index==4){
      showDialog(context: context, builder: (context) {
        return Dialog(
            child: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.7,
              height: 90,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 20
                  ),
                  Center(
                    child: TextButton(
                        child: Text('Baekjoon',
                          style: TextStyle(
                              fontSize: 30
                          ) ,
                        ),
                        onPressed: (){
                          Uri url = Uri.parse('https://www.acmicpc.net/user/dp4455');
                          launchUrl(url);
                        }
                    ),
                  ),
                ],
              ),
            )
        );
      });
    }



  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.navigate_before_outlined),
            tooltip: 'Next page',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context)=> MyPage()));
            },
          ),
        ],

        title: const Text(
          '포트폴리오',
          style: TextStyle(color: Colors.white,
          fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        elevation: 0.0,

      ),
      body: Column(
        children: [
          SizedBox(
            height: 600,
            child: ListView.builder(
              itemCount: potList.length,
                itemBuilder: (context, index){
                  return GestureDetector(
                    onTap: (){
                      debugPrint(potList[index]);
                      showPopup(context, potList[index], index);
                    },
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Column(
                          children: [
                            Text(
                                potList[index],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: width,
                              child: Center(
                                child: Text(
                                  descriptionList[index],
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey[500]
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                ),
          ),
          SizedBox(
            height: 25,
          ),
          Text('$cityName 의 현재 기온은 $temp2 C 입니다.',
          style: TextStyle(
            color: Colors.blue[200],
            fontWeight: FontWeight.bold,
            fontSize: 16
          ),)
        ],
      ),

    );
  }
}

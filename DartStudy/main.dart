import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyPage(),));
}

class MyPage extends StatelessWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: Text("내용 입력"),
        backgroundColor: Colors.grey[700],
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0.0, 0.0),
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              CircleAvatar(
                //backgroundImage: AssetImage('image/이미지명'),
                //image 이름의 폴더 만들기
                //pubspec.yaml 의 asset 부분 변경(플러터 이미지 등록 검색)
                radius: 70,
              ),
              Divider(
                height: 70.0,
                color: Colors.grey[800],
                thickness: 0.8,
                indent: 120.0,
                endIndent: 120.0,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                "곽주형: 소개",
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18
                ),
              ),
              SizedBox(
                height: 40, //여백 생성
              ),
              Text(
                "내용1",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),
              ),
              SizedBox(
                height: 40, //여백 생성
              ),
              Text(
                "내용2",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),
              ),
              SizedBox(
                height: 40, //여백 생성
              ),
              Text(
                "내용3",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),
              ),
              SizedBox(
                height: 40, //여백 생성
              ),
              Text(
                "내용4(감사합니다)",
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

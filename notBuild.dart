import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) { //1. flutter에서 모든 위젯은 build method를 가지고 있다.
    return MaterialApp(
        title: '2017748033',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SnackBarTest()
      // home: MyHomePage(),
    );
  }
}

class SnackBarTest extends StatelessWidget { ////3. SnackBarTest라는 커스텀 위젯도 자신만의 BuildContext를 가지고 있음
  //final snackBar = SnackBar(content: Text('SnackBar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold( //2. build method가 Scaffold 위젯을 반환할때 위젯 트리상에서 어디에 위치하는가에 대한 정보를 가자고 있는 context라는 것을 넣어서 리턴해준다는 의미
        appBar: AppBar( // 4. build method를 통해서 Scaffold위젯이 반환되며, 부모인 SnackBarTest의 BuildContext를 그대로 물려받음
          title: Text("BuildContext ex"),
          centerTitle: true,
        ),
        body:  Center(
              child: FlatButton(
                child: Text(
                  'show me',
                style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue[200],
                onPressed: () {
                  Scaffold.of(context).showSnackBar(SnackBar( //에러 발생
                                                              // Scaffold위젯이 위젯 트리 상에서 어디에 위치한지 알기 위해서 이 위젯은 context룰 참조해야함
                                                              // 그러나, Scaffold위젯의 context는 위젯 트리 내에서 Scaffold 위젯이 어디에 위치한지 정보를 가지고 있지 않음
                    content: Text('Hello HJ'),
                  ));
                },
              ),
            ),
        );
  }
}

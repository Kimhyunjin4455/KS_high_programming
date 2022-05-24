import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { //build메서드는 위젯 타입, BuildContext타입의 context라는 인자값
    return MaterialApp(
      debugShowCheckedModeBanner: false, //상단의 빨간배너 없앰
      title: 'HJ1',
      home: Grade(),
    );
  }
}


class Grade extends StatelessWidget { //1. Grade입력해야 12행의 빨간줄 사라짐 , Grade도 자신만의 빌드 컨텍스트 타입의 컨텍스트를 가지고 있음
  //const Grade({Key? key}) : super(key: key);
  final snackBar = SnackBar(content: Text('HELLOW'));
  @override
  Widget build(BuildContext context) {
    return Scaffold( //빌드 함수는 스캐폴드 위젯을 리턴(어디에 위치하는가에 대한 정보를 가진 context를 넣어 리턴함), 부모인 Grade의 컨텍스트를 그대로 물려 받음
      //스캐폴드의 컨텍스트는 정작 위젯트리 내에서 스캐폴드가 어디에 위치 한지 정보를 전혀 가지고 있지 않음
      //스캐폴드 위젯 내에서 빌드로 위젯을 리턴하면, 그 위젯은 부모인 스캐폴드 위젯의 진짜 컨텍스트를 물려 받음
      backgroundColor: Colors.amber[800],
      appBar: AppBar(
        title: Text('pokemon'),
        backgroundColor: Colors.amber[700],
        centerTitle: true,
        elevation: 0.0,
        //leading: IconButton(
        //  icon: Icon(Icons.menu),
        //  onPressed: () {
        //    print('menu button is clicked');
        //  },
        //),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              print('Shopping cart button is clicked');
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print('Search button is clicked');
            },
          ),
        ],
      ),
      body: MySnackBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/pika2.png'),
                  backgroundColor: Colors.blue[300],
              ),
              otherAccountsPictures: <Widget>[
                CircleAvatar(
                  backgroundImage: AssetImage('assets/flying.png'),
                  backgroundColor: Colors.white,
                ),
                // CircleAvatar(
                //   backgroundImage: AssetImage('assets/flying.png'),
                //   backgroundColor: Colors.white,
                // ), // 시프트로 묶고 커맨드 + / 하면 전체 주석처리 가능
              ],
              accountName:  Text('Hyunjin'), // Text()는 위젯
              accountEmail: Text('dp4455@naver.com'),
              onDetailsPressed: (){
                print('arrow is clicked');
              },//클릭하면 밑으로 펼쳐지면서 무언가를 더 보여줌 > 기능을 수행할 함수의 모습 (){}이 있어야함
              decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35.0),
                  bottomRight: Radius.circular(35.0),
                ), // ????? 위젯은 대문자로 시작? 오른쪽은 속성? 명칭이 무엇인지
              ),  // BoxDecoration()는 위젯
            ),
            ListTile(
              leading: Icon(Icons.home,
              color: Colors.grey[800],
              ), // Icon사용을 위해 leading 속성 사용
              title: Text('Home'),
              onTap: (){
                print('Home is clicked');
              },
              trailing: Icon(Icons.add), // '+'모양의 아이콘이 추가됨
            ),
            ListTile(
              leading: Icon(Icons.settings,
                color: Colors.grey[800],
              ), // Icon사용을 위해 leading 속성 사용
              title: Text('Setting'),
              onTap: (){
                print('Setting is clicked');
              },
              trailing: Icon(Icons.add),
            ),
            ListTile(
              leading: Icon(Icons.question_answer,
                color: Colors.grey[800],
              ), // Icon사용을 위해 leading 속성 사용
              title: Text('Q&A'),
              onTap: (){
                print('Q&A is clicked');
              },
              trailing: Icon(Icons.add),
            ),
          ], //????? child와 children의 차이 파악하기
        ),
      ),
    ); //2. scaffold로 바꾸기
  }
}

class MySnackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Transform.scale(scale: 2.2 ,
                child: Image(image: AssetImage('assets/pikamove2.gif'),
                    height: 50,
                    width: 50,
                ),

            ),
          ),
          SizedBox(
            height: 35,
          ),
          Center(
            child: RaisedButton(
              child: Text('touch',
                style: TextStyle(
                    color: Colors.white
                ),
              ),
              color: Colors.amber[500],
              onPressed: (){
                Scaffold.of(context)
                    .showSnackBar(SnackBar(
                    content: Text('pika pi   \\\\ >-< //',
                    textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white
                      ),
                    ),
                  backgroundColor: Colors.amber[300],
                  duration: Duration(milliseconds: 800),
                ),
                ); //context만 쓰면 grade의 컨텍스트임
              },
            ),
          ),
          Divider(
            height: 60.0,
            color: Colors.grey[850],
            thickness: 0.5,
            endIndent: 30.0,
          ),
          Text('Name',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Text('pikachu',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
            ),),
          SizedBox(
            height: 30.0,
          ),

          Text('Pokemon lever',
            style: TextStyle(
              color: Colors.white,
              letterSpacing: 2.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),

          Text('32',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold
            ),),

          SizedBox(
            height: 30.0,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10.0,
              ),
              Text('아이언 테일',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10.0,
              ),
              Text('볼트태클',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10.0,
              ),
              Text('10만 볼트',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.check_circle_outline),
              SizedBox(
                width: 10.0,
              ),
              Text('전광석화',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Icon(Icons.add_circle_outline),
              SizedBox(
                width: 10.0,
              ),
              Text('도구: 전기구슬',
                style: TextStyle(
                    fontSize: 16.0,
                    letterSpacing: 1.0
                ),),
            ],
          ),
          SizedBox(
            height: 25.0,
          ),
          Center(
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/flying.png'),
              radius: 40.0,
              backgroundColor: Colors.amber[800],
            ),
          )
        ],
      ),
    );

  }
}
//BuildContext: 위젯 트리에서 현재 위젯의 위치를 알 수 있는 정보
//모든 위젯은 자신만의 빌드 컨텍스트를 가짐
//플러터에서 모든 위젯은 빌드 메서드(함수)를 가지고 있고 이를 통해 계층구좋 형성함
//빌드 컨텍스트는 stateless위젯이나 state빌드메서드에 의해 리턴된 위젯의 부모가 됨

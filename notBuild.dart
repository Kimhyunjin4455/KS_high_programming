import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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

class SnackBarTest extends StatelessWidget {
  //final snackBar = SnackBar(content: Text('SnackBar'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
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
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text('Hello HJ'),
                  ));
                },
              ),
            ),
        );
  }
}

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome to Flutter'),
          centerTitle: true,
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}

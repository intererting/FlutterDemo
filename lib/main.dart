import 'package:flutter/material.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/ui_exe/exe_1.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black
      ),
      home: new Home(),
      routes: <String, WidgetBuilder>{
        '/exe1': (BuildContext context) => new Exe1()
      },
    );
  }
}

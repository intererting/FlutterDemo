import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';
import 'package:flutter_demo/home.dart';
import 'package:flutter_demo/ui_exe/listview_1.dart';
import 'package:flutter_demo/ui_exe/test_page.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(primaryColor: Colors.black),
      home: new Home(),
      routes: <String, WidgetBuilder>{
        Route_ListView_1: (BuildContext context) => new ListView_1(),
        Route_Test_Page: (BuildContext context) => new TestPage()
      },
    );
  }
}

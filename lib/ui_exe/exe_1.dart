import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Exe1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Exe_1'),
          centerTitle: true,
        ),
      ),
    );
  }
}

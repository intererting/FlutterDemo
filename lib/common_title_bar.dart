import 'package:flutter/material.dart';

class CommonTitleBar extends StatelessWidget {
  CommonTitleBar({this.title, this.body});

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
            title: Text(title),
            centerTitle: true,
          ),
          body: body,
        ));
  }
}

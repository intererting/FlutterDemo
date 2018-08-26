import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter'),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new RaisedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(Route_ListView_1);
            },
            color: Colors.blue,
            child: new Container(
              child: new Text(
                'ListView_1',
                style: new TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}

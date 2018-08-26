import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key) {}

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
              Navigator.of(context).pushNamed('/exe1');
            },
            color: Colors.blue,
            child: new Container(
              child: new Text('exe1',style: new TextStyle(
                color: Colors.white
              ),),
            ),
          )
        ],
      ),
    );
  }
}

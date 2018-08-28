import 'package:flutter/material.dart';
import 'package:flutter_demo/common_title_bar.dart';
import 'package:flutter_demo/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DbTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CommonTitleBar(
      title: 'Db',
      body: _buildBody(),
    );
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        Container(
          child: RaisedButton(
            color: Colors.blue,
            highlightColor: Colors.red,
            onPressed: () {
              _incrementCounter();
            },
            child: Text('test_sp'),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: RaisedButton(
            onPressed: () {
              _incrementCounter();
            },
            child: Text('test_db'),
          ),
        )
      ],
    );
  }

  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) + 1;
    print('Pressed $counter times.');
    await prefs.setInt('counter', counter);
  }
}

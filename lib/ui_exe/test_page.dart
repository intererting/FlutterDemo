import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.of(context).pop('haha');
                }),
            title: Text('Test'),
            centerTitle: true,
            actions: <Widget>[
              _buildAction()
            ],
          ),
          body: new Material(
            child: new Counter(),
          ),
        ));
  }

  _buildAction() {
    return new Builder(builder: (BuildContext context) {
      return IconButton(
        icon: Icon(Icons.add),
        onPressed: () {
          print('snackbar');
          Scaffold
              .of(context)
              .showSnackBar(SnackBar(content: Text('test snackbar')));
        },
      );
    });
  }

  Widget _testExpand() {
    return new Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Container(
            height: 100.0,
            color: Colors.blue,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            height: 100.0,
            color: Colors.red,
          ),
        ),
        Expanded(
          flex: 3,
          child: Container(
            height: 100.0,
            color: Colors.green,
          ),
        )
      ],
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay._({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('count ${count}');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor._({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('click'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _count = 0;

  void _onPressed() {
    setState(() {
      ++_count;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        CounterDisplay._(
          count: _count,
        ),
        CounterIncrementor._(
          onPressed: _onPressed,
        )
      ],
    );
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('MyButton Click');
      },
      child: Container(
        child: Center(
          child: Text('click'),
        ),
      ),
    );
  }
}

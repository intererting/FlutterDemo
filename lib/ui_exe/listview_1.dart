import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListView_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primaryColor: Colors.black,
      ),
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('TextPage'),
          centerTitle: true,
        ),
        body: new RandomWords(),
      ),
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _font = const TextStyle(fontSize: 18.0);
  final _saved = new Set<int>();

  @override
  Widget build(BuildContext context) {
    return _buildSuggestions();
  }

  Widget _buildSuggestions() {
    return new ListView.builder(
      padding: EdgeInsets.all(12.0),
//      itemExtent: 100.0,
      itemBuilder: (BuildContext context, int index) {
        return _buildRow(index);
      },
    );
  }

  Widget _buildRow(int index) {
    if (index.isOdd) {
      return new Divider(
        height: 1.0,
      );
    }

    final nowIndex = index ~/ 2;
    final _alraedySaved = _saved.contains(nowIndex);

    return new ListTile(
      title: new Text(
        'entry ${nowIndex}',
        style: _font,
      ),
      trailing: new Icon(
        _alraedySaved ? Icons.favorite : Icons.favorite_border,
        color: _alraedySaved ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (_alraedySaved) {
            _saved.remove(nowIndex);
          } else {
            _saved.add(nowIndex);
          }
        });
      },
    );
  }
}

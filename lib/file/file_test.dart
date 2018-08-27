import 'dart:io';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_demo/common_title_bar.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(FileDemo());
}

class FileDemo extends StatefulWidget {
  FileDemo({Key key}) : super(key: key);

  @override
  _FileDemoState createState() => _FileDemoState();
}

class _FileDemoState extends State<FileDemo> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    _readCounter().then((counter) {
      setState(() {
        _counter = counter;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonTitleBar(
      title: 'FileDemo',
      body: _buildBody(),
    );
  }

  Future<int> _readCounter() async {
    try {
      File file = await _getLocalFile();
      String content = await file.readAsString();
      return int.parse(content);
    } catch (e) {
      return 0;
    }
  }

  Future<File> _getLocalFile() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String dir = directory.path;
    print('dir  $dir');
    return File('$dir/counter.txt');
  }

  _incrementCounter() async {
    setState(() {
      _counter++;
    });
    await (await _getLocalFile()).writeAsString('$_counter');
  }

  _buildBody() {
    return Column(
      children: <Widget>[
        Text('counter= $_counter'),
        Container(
          margin: EdgeInsets.only(top: 10.0),
          child: RaisedButton(
            onPressed: () {
              _incrementCounter();
            },
            child: Text('click'),
          ),
        )
      ],
    );
  }
}

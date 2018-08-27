import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_demo/common_title_bar.dart';

class NativeTest extends StatefulWidget {
  @override
  _NativeTestState createState() => _NativeTestState();
}

class _NativeTestState extends State<NativeTest> {
  final platform = MethodChannel('samples.flutter.io/battery');
  String _batteryLevel = '';

  @override
  Widget build(BuildContext context) {
    return CommonTitleBar(
      title: 'native_con',
      body: _buildBody(),
    );
  }

  Future<Null> _getBatteryLevel() async {
    String batteryLevel = '';
    try {
      final result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level is ${result}%';
    } catch (e) {
      batteryLevel = 'catch exception ${e.toString()}';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  _buildBody() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Text(
            _batteryLevel,
            softWrap: true,
            style: TextStyle(fontSize: 18.0),
          ),
        ),
        RaisedButton(
          onPressed: () {
            _getBatteryLevel();
          },
          child: Container(
            margin: EdgeInsetsDirectional.only(start: 10.0),
            child: Text('getBattery'),
          ),
        )
      ],
    );
  }
}

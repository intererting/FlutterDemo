import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_demo/common_title_bar.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => new _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 2000));
    animation = Tween(begin: 0.0, end: 300.0).animate(controller)
      ..addStatusListener((state) {
        if (state == AnimationStatus.completed) {
          controller.reverse();
        }
      });
  }

  Widget build(BuildContext context) {
    return CommonTitleBar(
      title: 'Animation',
      body: _buildBody(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    if (controller != null) {
      controller.dispose();
    }
  }

  _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TextField(
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.black,
          ),
          decoration: InputDecoration(
              prefixIcon: Container(
            padding: EdgeInsets.only(right: 5.0),
            child: Icon(Icons.schedule),
          )),
//          decoration: InputDecoration(border: InputBorder.none),
          onSubmitted: (value) {
            print('value  ${value}');
          },
        ),

//          foregroundDecoration: BoxDecoration(color: Colors.blue),
        Container(
          margin: EdgeInsets.only(top: 20.0),
          child: RaisedButton(
            color: Colors.blue,
            child: Text('forward'),
            onPressed: () {
              controller.forward();
            },
          ),
        ),
        AnimatedLogo(
          animation: animation,
        ),
      ],
    );
  }
}

void main() {
  runApp(new LogoApp());
}

class AnimatedLogo extends AnimatedWidget {
  AnimatedLogo({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable;
    return Container(
      margin: EdgeInsets.only(top: 50.0),
      width: animation.value,
      height: animation.value,
      child: new FlutterLogo(),
    );
  }
}

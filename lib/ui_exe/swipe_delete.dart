import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/utils.dart';

void main() {
  runApp(new MyApp(
    items: new List<String>.generate(20, (i) => "Item ${i + 1}"),
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final title = 'Dismissing Items';

    return new MaterialApp(
      title: title,
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text(title),
        ),
        body: new ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return new SwipeDeleteItem(
              child: ListTile(title: new Text('$item')),
            );
          },
        ),
      ),
    );
  }
}

class SwipeDeleteItem extends StatefulWidget {
  SwipeDeleteItem({this.child});

  final Widget child;

  @override
  _SwipeDeleteItemState createState() => _SwipeDeleteItemState();
}

class _SwipeDeleteItemState extends State<SwipeDeleteItem>
    with TickerProviderStateMixin {
  AnimationController _controller;

  double _pointer_down_dx = 0.0;
  double _drag_dis = 0.0;
  Animation<Offset> _moveAnimation;

  @override
  initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 20), vsync: this);
    _updateAnimation();
  }

  _updateAnimation() {
    print(_drag_dis / getScreenWidth());
    _moveAnimation = new Tween<Offset>(
      begin: Offset.zero,
      end: new Offset(_drag_dis / getScreenWidth(), 0.0),
    ).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    Widget swipItem = Row(
      children: <Widget>[
        Expanded(
          child: widget.child,
        ),
        Container(
          width: -_drag_dis < 0.0 ? 0.0 : -_drag_dis,
          color: Colors.red,
          child: Text(
            '删除',
            style: TextStyle(fontSize: 13.0, color: Colors.white),
          ),
        )
      ],
    );

    Widget content =
        new SlideTransition(position: _moveAnimation, child: swipItem);

    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragDown: _handleDragDown,
      child: content,
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _drag_dis = details.globalPosition.dx - _pointer_down_dx;
    setState(() {
      _updateAnimation();
    });
    if (!_controller.isAnimating) {
      _controller.value = -_drag_dis / getScreenWidth();
    }
  }

  void _handleDragDown(DragDownDetails details) {
    _pointer_down_dx = details.globalPosition.dx;
  }
}

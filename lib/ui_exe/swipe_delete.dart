import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

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

class _SwipeDeleteItemState extends State<SwipeDeleteItem> {
  double pointer_down_dx = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragUpdate: _handleDragUpdate,
      onHorizontalDragDown: _handleDragDown,
      child: widget.child,
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    double dx = details.globalPosition.dx;

    print(details.globalPosition.dx);
  }

  void _handleDragDown(DragDownDetails details) {
    pointer_down_dx = details.globalPosition.dx;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_demo/constants.dart';

class Home extends StatelessWidget {
  final _titles = <String>[
    'ListView_1',
    'TestPage',
    'ShoppingCar',
    'BannerView',
    'NativeCode',
    'SaveData'
  ];
  final _font = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Welcome to Flutter'),
        centerTitle: true,
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return _buildRow(context, index);
        },
        itemCount: _titles.length * 2,
      ),
    );
  }

  Widget _buildRow(BuildContext context, int index) {
    if (index.isOdd) {
      return new Divider(
        height: 1.0,
      );
    }
    final nowIndex = index ~/ 2;
    return new ListTileTheme(
      textColor: Colors.white,
      child: new Container(
        color: Colors.blue,
        child: new ListTile(
          title: new Text(
            _titles[nowIndex],
            style: _font,
          ),
          onTap: () {
            switch (nowIndex) {
              case 0:
                Navigator.of(context).pushNamed(Route_ListView_1);
                break;
              case 1:
                Navigator.of(context).pushNamed(Route_Test_Page);
                break;
              case 2:
                Navigator.of(context).pushNamed(Route_Shopping_Car);
                break;
              case 3:
                Navigator.of(context).pushNamed(Route_View_Pager);
                break;
              case 4:
                Navigator.of(context).pushNamed(Route_Native);
                break;
              case 5:
                Navigator.of(context).pushNamed(Route_Save_Data);
                break;
            }
          },
        ),
      ),
    );
  }
}

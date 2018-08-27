// Copyright 2017 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class TabbedAppBarSample extends StatefulWidget {
  @override
  _TabbedAppBarSampleState createState() => _TabbedAppBarSampleState();
}

class _TabbedAppBarSampleState extends State<TabbedAppBarSample>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  initState() {
    super.initState();
    _tabController = TabController(length: choices.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: const Text('Tabbed AppBar'),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: new TabBarView(
                controller: _tabController,
                children: choices.map((Choice choice) {
                  return new Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: new ChoiceCard(choice: choice),
                  );
                }).toList(),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 4.0, bottom: 4.0),
              color: Colors.blue,
              child: new TabBar(
                indicator: null,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                controller: _tabController,
                labelStyle: TextStyle(color: Colors.black),
                unselectedLabelStyle: TextStyle(color: Colors.white),
                isScrollable: false,
                tabs: _buildTabs(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _buildTabs() {
    return choices.map((Choice choice) {
      return Column(
        children: <Widget>[
          Icon(choice.icon),
          Padding(
            padding: EdgeInsets.only(top: 3.0),
            child: Text(
              choice.title,
              style: TextStyle(fontSize: 11.0),
            ),
          ),
        ],
      );
    }).toList();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}

class Choice {
  const Choice({this.title, this.icon, this.index});

  final int index;
  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(index: 0, title: 'CAR', icon: Icons.directions_car),
  const Choice(index: 1, title: 'BICYCLE', icon: Icons.directions_bike),
  const Choice(index: 2, title: 'BOAT', icon: Icons.directions_boat),
  const Choice(index: 3, title: 'BUS', icon: Icons.directions_bus),
  const Choice(index: 4, title: 'TRAIN', icon: Icons.directions_railway),
//  const Choice(title: 'WALK', icon: Icons.directions_walk),
];

class ChoiceCard extends StatelessWidget {
  const ChoiceCard({Key key, this.choice}) : super(key: key);

  final Choice choice;

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.display1;
    return new Card(
      color: Colors.white,
      child: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Icon(choice.icon, size: 128.0, color: textStyle.color),
            new Text(choice.title, style: textStyle),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(new TabbedAppBarSample());
}

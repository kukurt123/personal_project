import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/widgets/text/text_deco.dart';

import '../main_drawer.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MainDrawer(),
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          color: Theme.of(context).primaryColor,
          child: Center(
              child: Text('WELCOME!',
                  style:
                      TextStyle1(size: 30, color: Colors.white, isBold: true))),
        ));
  }
}

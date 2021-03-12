import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'main_drawer.dart';

class Page2 extends StatelessWidget {
  const Page2({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page2'),
      ),
      drawer: MainDrawer(),
      body: Center(
        child: Text('PAGE 2'),
      ),
    );
  }
}

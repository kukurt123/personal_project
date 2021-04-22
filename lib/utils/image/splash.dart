import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  final String path;

  const Splash({Key key, this.path}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            image:
                DecorationImage(fit: BoxFit.contain, image: AssetImage(path))),
      )),
    );
  }
}

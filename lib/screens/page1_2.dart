import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/page1_2/page1_2_rx.dart';

class Page1_2 extends StatefulWidget {
  Page1_2({Key key}) : super(key: key);

  @override
  _Page1_2State createState() => _Page1_2State();
}

class _Page1_2State extends State<Page1_2> {
  final page1_2rx = Modular.get<Page1_2rx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('I AM PAGE1_2'),
        ),
        body: Column(children: <Widget>[
          StreamBuilder(
            stream: page1_2rx.count,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return CircularProgressIndicator();
              }
              return Text(snapshot.data.toString());
            },
          ),
          ButtonBar(
            children: [
              FlatButton(
                child: Text(
                  'click me ++++',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  page1_2rx.add();
                },
              ),
              FlatButton(
                child: Text(
                  'click me ----',
                  style: TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  page1_2rx.subtract();
                },
              )
            ],
          ),
        ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            // Navigator.pop(context);
            Modular.to.pushNamed('/page1/page3/page2/page4');
          },
        ));
  }
}

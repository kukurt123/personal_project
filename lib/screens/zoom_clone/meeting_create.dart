import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/widgets/text/text_deco.dart';

class MeetingCreate extends StatefulWidget {
  MeetingCreate({Key key}) : super(key: key);

  @override
  _MeetingCreateState createState() => _MeetingCreateState();
}

class _MeetingCreateState extends State<MeetingCreate> {
  final zoomBloc = Modular.get<ZoomBloc>();
  var rand = new Random(999999);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          'Create a code and share it with you friends',
          style: TextStyle1(size: 15, isBold: true),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Code:',
              style: TextStyle1(isBold: true, size: 20),
            ),
            SizedBox(
              width: 40,
            ),
            StreamBuilder(
                stream: zoomBloc.codeNumber.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {}
                  return Text(
                    snapshot.hasData ? snapshot.data.toString() : '',
                    style: TextStyle1(
                        isBold: true, size: 20, color: Colors.green[900]),
                  );
                }),
          ],
        ),
        SizedBox(height: 30),
        RaisedButton(
          padding: EdgeInsets.all(0.0),
          shape: StadiumBorder(),
          textColor: Colors.white,
          onPressed: () {
            var output = rand.nextInt(999999);
            while (output < 100000) {
              output *= 3;
            }
            zoomBloc.changeNumber(output);
          },
          child: Container(
            child: Text('GENERATE CODE', style: TextStyle(fontSize: 15.0)),
            padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: LinearGradient(colors: <Color>[
                  Color(0xFFFF2F00),
                  Color(0xFFF2731E),
                ])),
          ),
        )
      ],
    );
  }
}

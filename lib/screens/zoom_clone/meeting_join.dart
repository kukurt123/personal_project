import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class MeetingJoin extends StatefulWidget {
  MeetingJoin({Key key}) : super(key: key);

  @override
  _MeetingJoinState createState() => _MeetingJoinState();
}

class _MeetingJoinState extends State<MeetingJoin> {
  final zoomBloc = Modular.get<ZoomBloc>();
  String currentText = "";
  StreamController<ErrorAnimationType> errorController;
  @override
  Widget build(BuildContext context) {
    void changeIsVideoMuted() {
      setState(() {
        zoomBloc.isVideoMuted = !zoomBloc.isVideoMuted;
      });
    }

    void changeIsAudioMuted() {
      setState(() {
        zoomBloc.isAudioMuted = !zoomBloc.isAudioMuted;
      });
    }

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Room Code', style: TextStyle1(isBold: true, size: 20)),
          SizedBox(
            height: 30,
          ),
          Text('Code', style: TextStyle1(size: 15, isBold: true)),
          SizedBox(
            height: 5,
          ),
          PinCodeTextField(
            length: 6,
            obscureText: false,
            animationType: AnimationType.fade,
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: Colors.white,
            ),
            animationDuration: Duration(milliseconds: 300),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            enableActiveFill: true,
            errorAnimationController: errorController,
            autoDisposeControllers: false,
            controller: zoomBloc.roomController,
            onCompleted: (v) {
              print("Completed");
            },
            onChanged: (value) {
              print(value);
              setState(() {
                currentText = value;
              });
            },
            beforeTextPaste: (text) {
              print("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
            appContext: context,
          ),
          TextField(
            controller: zoomBloc.nameController,
            decoration: InputDecoration(
                labelText: 'Alias',
                // hasFloatingPlaceholder: true,
                hintText: "Alias",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green)),
                // icon: Icon(Icons.score),
                border: OutlineInputBorder()),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Video Muted', style: TextStyle1(isBold: true, size: 15)),
                Checkbox(
                  onChanged: (bool value) {
                    changeIsVideoMuted();
                  },
                  value: zoomBloc.isVideoMuted,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Audio Muted', style: TextStyle1(isBold: true, size: 15)),
                Checkbox(
                  onChanged: (bool value) {
                    changeIsAudioMuted();
                  },
                  value: zoomBloc.isAudioMuted,
                )
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(
            color: Colors.black12,
            height: 1,
          ),
          SizedBox(height: 30),
          RaisedButton(
            padding: EdgeInsets.all(0.0),
            shape: StadiumBorder(),
            textColor: Colors.white,
            onPressed: () {
              zoomBloc.joinMeeting();
            },
            child: Container(
              child: Text('JOIN MEETING', style: TextStyle(fontSize: 15.0)),
              padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  gradient: LinearGradient(colors: <Color>[
                    Color(0xFF0099FF),
                    Color(0xFF4FB3F5),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}

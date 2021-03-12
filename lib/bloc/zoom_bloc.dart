import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:jitsi_meet/feature_flag/feature_flag.dart';
import 'package:jitsi_meet/feature_flag/feature_flag_enum.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:rxdart/rxdart.dart';

class ZoomBloc {
  final currentUser = new BehaviorSubject<SocialUser>();
  final codeNumber = new BehaviorSubject<int>();
  final roomController = new TextEditingController();
  final nameController = new TextEditingController();
  bool isVideoMuted = false;
  bool isAudioMuted = false;

  changeUser({SocialUser user}) {
    currentUser.sink.add(user);
  }

  edit(SocialUser user) {
    currentUser.add(user);
  }

  changeNumber(int num) {
    codeNumber.sink.add(num);
  }

  joinMeeting() async {
    print('trying meeting');
    try {
      FeatureFlag featureFlag = FeatureFlag();
      featureFlag.welcomePageEnabled = false;
      // Here is an example, disabling features for each platform
      if (Platform.isAndroid) {
        // Disable ConnectionService usage on Android to avoid issues (see README)
        featureFlag.callIntegrationEnabled = false;
      } else if (Platform.isIOS) {
        // Disable PIP on iOS as it looks weird
        featureFlag.pipEnabled = false;
      }

      var options = JitsiMeetingOptions()
        ..room = roomController.text
        ..userDisplayName = nameController.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoMuted
        ..featureFlag = featureFlag;

      await JitsiMeet.joinMeeting(options);
      print('join meeting....');
    } catch (e) {}
  }
}

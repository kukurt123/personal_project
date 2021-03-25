import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:rxdart/rxdart.dart';
import 'package:http/http.dart' as http;
import 'package:new_practice/main.dart';
import 'package:time/time.dart';

class MainBloc {
  final currentUser = new BehaviorSubject<SocialUser>();

  changeUser({SocialUser user}) {
    currentUser.sink.add(user);
  }

  edit(SocialUser user) {
    currentUser.add(user);
  }

  Future<void> sendPushMessage() async {
    String token;
    // if (_token == null) {
    //   print('Unable to send FCM message, no token exists.');
    //   return;
    // }
    await 5.seconds.delay;
    await FirebaseMessaging.instance.getToken(vapidKey: 'myId').then((key) {
      token = key;
    });
    try {
      await http.post(
        Uri.parse('https://api.rnfirebase.io/messaging/send'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'token': token,
          'data': {'via': 'flutterFire cloud!!', 'count': '1'},
          'notification': {
            'title': 'Hello flutterfire!',
            'body': 'this notification was created via FCM!'
          }
        }),
      );
      print('FCM request for device sent!');
    } catch (e) {
      print(e);
    }
  }

  firebaseOnMessage() async {
    await FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage message) {
      if (message != null) {
        // Navigator.pushNamed(context, '/message',
        //     arguments: MessageArguments(message, true));
      }
    });
    await FirebaseMessaging.instance.subscribeToTopic('fcm_test');
    print('listen');
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('show notification2...');
      RemoteNotification notification = message.notification;
      AndroidNotification android = message.notification?.android;
      print('show notification1...');
      if (notification != null && android != null) {
        print('show notification...');
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: 'launch_background',
              ),
            ));
      }
    });
    FirebaseMessaging.instance.subscribeToTopic('myId');
  }

  firebaseOnMessageOpenedApp() {
    //  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   print('A new onMessageOpenedApp event was published!');
    //   Navigator.pushNamed(context, '/message',
    //       arguments: MessageArguments(message, true));
    // });
  }

  // add() {
  //   print('adding');
  //   count.sink.add(count.value == null ? 1 : count.value + 1);
  // }

  // subtract() {
  //   print('subtracting');
  //   count.sink.add(count.value == null ? 1 : count.value - 1);
  // }
}

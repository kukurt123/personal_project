import 'dart:io';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:hive/hive.dart';
import 'package:new_practice/utils/image/splash.dart';
import 'package:sizer/sizer.dart';
import 'routing/app_module.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'utils/loading/loading_util.dart';

FirebaseMessaging firebaseMessaging1;
Future<void> main() async {
  Hive..init(Directory.current.path);
  // ..registerAdapter(PersonAdapter());
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterDownloader.initialize(
      debug: true // optional: set false to disable printing logs to console
      );
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(FirebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );

  runApp(ModularApp(
    module: AppModule(),
  ));
}

Future<void> FirebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class AppWidget extends StatelessWidget {
  final loadingUtil = Modular.get<LoadingUtil>();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          SizerUtil().init(constraints, orientation);
          return FutureBuilder(
              future: Future.delayed(Duration(seconds: 0)),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return MaterialApp(
                      home: Splash(
                    path: 'assets/images/splash.png',
                  ));
                } else {
                  final botToastBuilder = BotToastInit();
                  return MaterialApp(
                    // builder:
                    builder: (context, child) {
                      // child = loadingUtil.easyLoadingInit();
                      child = botToastBuilder(context, child);
                      return child;
                    },
                    navigatorObservers: [BotToastNavigatorObserver()],
                    initialRoute: true != false ? "/main" : "/main",
                    navigatorKey: Modular.navigatorKey,
                    onGenerateRoute: Modular.generateRoute,
                    theme: ThemeData(
                      primarySwatch: Colors.blue,
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                  );
                }
              });
        },
      );
    });
  }
}

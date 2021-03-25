import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_practice/main.dart';
import 'package:time/time.dart';

final FirebaseMessaging fcm = FirebaseMessaging.instance;

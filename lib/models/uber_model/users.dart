import 'package:flutter/widgets.dart';

class Users {
  Users(
      {@required this.uid,
      @required this.photoUrl,
      @required this.displayName});

  final String uid;
  final String photoUrl;
  final String displayName;
}

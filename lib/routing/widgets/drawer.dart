import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/main_drawer.dart';

class DrawerModule extends WidgetModule {
  @override
  List<Bind> get binds => [];

  Widget get view => DrawerMain();
}

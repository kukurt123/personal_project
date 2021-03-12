import 'dart:async';

import 'package:flutter/semantics.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppBloc extends Disposable {
  final controller = StreamController();

  @override
  void dispose() {
    controller.close();
  }
}

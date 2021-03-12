import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/page1_1/page1_1_barrel.dart';
import 'package:new_practice/bloc/page1_2/page1_2_rx.dart';
import 'package:new_practice/screens/page1_1.dart';
import 'package:new_practice/screens/page1_2.dart';
import 'package:new_practice/screens/page1_3.dart';
import 'package:new_practice/screens/page1_4.dart';

class Page1_1Module extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Page1Bloc()),
        // Bind((i) => Page1_3rx()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => Page1_1()),
        ModularRouter('/page3', module: Page1_3Module()),
      ];

  static Inject get to => Inject<Page1_1Module>.of();
}

class Page1_2Module extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => Page1_2rx()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => Page1_2()),
        ModularRouter('/page4', child: (_, args) => Page1_4()),
      ];

  static Inject get to => Inject<Page1_2Module>.of();
}

class Page1_3Module extends ChildModule {
  @override
  List<Bind> get binds => [
        // Bind((i) => Page1_3rx()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => Page1_3(foods: args.data)),
        ModularRouter('/page2', module: Page1_2Module()),
      ];

  static Inject get to => Inject<Page1_3Module>.of();
}

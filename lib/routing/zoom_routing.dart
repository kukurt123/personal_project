import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/screens/zoom_clone/zoom_home.dart';

class ZoomModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => ZoomBloc())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => ZoomHome()),
        ModularRouter('/home', child: (_, args) => ZoomHome()),
      ];

  static Inject get to => Inject<ZoomModule>.of();
}

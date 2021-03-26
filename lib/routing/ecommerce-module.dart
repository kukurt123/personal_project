import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/screens/restaurant/cart_page.dart';
import 'package:new_practice/screens/zoom_clone/zoom_home.dart';
import 'package:new_practice/screens/zoom_clone/zoom_intro.dart';
import 'package:new_practice/screens/zoom_clone/zoom_login.dart';

class ZoomModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => ZoomBloc())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => ZoomIntro()),
        ModularRouter('/login', child: (_, args) => ZoomLogin()),
        ModularRouter('/home', child: (_, args) => ZoomHome()),
        //         ModularRouter('/user', module: UserDetails()),
      ];

  static Inject get to => Inject<ZoomModule>.of();
}

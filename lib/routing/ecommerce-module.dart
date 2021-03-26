import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_details.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_main.dart';
import 'package:new_practice/screens/restaurant/cart_page.dart';
import 'package:new_practice/screens/zoom_clone/zoom_home.dart';
import 'package:new_practice/screens/zoom_clone/zoom_intro.dart';
import 'package:new_practice/screens/zoom_clone/zoom_login.dart';

class EcommerceModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => ZoomBloc())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => EcommerceMain()),
        ModularRouter('/details', child: (_, args) => EcommerceDetails()),
        // ModularRouter('/home', child: (_, args) => EcommerceBilling()),
        //         ModularRouter('/user', module: UserDetails()),
      ];

  static Inject get to => Inject<EcommerceModule>.of();
}

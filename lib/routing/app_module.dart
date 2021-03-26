import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/bloc/page1_1/page1_1_bloc.dart';
import 'package:new_practice/bloc/page1_3/page1_3rx.dart';
import 'package:new_practice/bloc/qr_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/models/uber_model/email-sign-in-change.model.dart';
import 'package:new_practice/repo/page1_1_repo.dart';
import 'package:new_practice/routing/resto_routing.dart';
import 'package:new_practice/routing/social_media.dart';
import 'package:new_practice/samples/navigation_drawer/navigation_drawer_home.dart';
import 'package:new_practice/screens/home/my_home_page.dart';
import 'package:new_practice/screens/login/login.dart';
import 'package:new_practice/screens/page2.dart';
import 'package:new_practice/screens/uber/login/sign-in-manager.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import '../main.dart';
import 'carousel_demo_routing.dart';
import 'ecommerce-module.dart';
import 'page1_routing.dart';
import 'qr_module.dart';
import 'uber_module.dart';
import 'zoom_routing.dart';

class AppModule extends MainModule {
  @override
  // TODO: implement binds
  List<Bind> get binds => [
        Bind((i) => Page1Bloc(repo: new Page1Repository())),
        Bind((i) => Page1_3rx(), singleton: true),
        Bind((i) => MainBloc()),
        Bind((i) => AuthService()),
        Bind((i) => SignInManager()),
        Bind((i) => EmailSignInChangeModel(), singleton: false),
        Bind((i) => QrBloc()),
        Bind((i) => UberUserBloc()),
      ];
  @override
  Widget get bootstrap => AppWidget();

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/main', module: MainRouting()),
      ];
}

//child
class MainRouting extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(
          '/home',
          child: (_, __) => MyHomePage(),
        ),
        ModularRouter('/page1', module: Page1_1Module()),
        ModularRouter('/page2', child: (_, __) => Page2()),
        ModularRouter('/samples', child: (_, __) => HomePage()),
        ModularRouter('/resto', module: RestoModule()),
        ModularRouter('/login', child: (_, __) => Login()),
        ModularRouter('/social', module: SocialMediaModule()),
        ModularRouter('/carousel_demo', module: CarouselDemoModule()),
        ModularRouter('/zoom_clone', module: ZoomModule()),
        ModularRouter('/uber', module: UberModule()),
        ModularRouter('/qr', module: QrModule()),
        ModularRouter('/ecommerce', module: EcommerceModule()),
      ];

  static Inject get to => Inject<MainModule>.of();
}

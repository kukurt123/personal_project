import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/main.dart';
import 'package:new_practice/routing/carousel_demo_routing.dart';
import 'package:new_practice/routing/page1_routing.dart';
import 'package:new_practice/routing/qr_module.dart';
import 'package:new_practice/routing/resto_routing.dart';
import 'package:new_practice/routing/social_media.dart';
import 'package:new_practice/routing/uber_module.dart';
import 'package:new_practice/routing/zoom_routing.dart';
import 'package:new_practice/samples/navigation_drawer/navigation_drawer_home.dart';
import 'package:new_practice/screens/login/login.dart';
import 'package:new_practice/screens/page2.dart';

List<ModularRouter> routing() => [
      ModularRouter(
        '/main',
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
    ];

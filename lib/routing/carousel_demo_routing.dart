import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/carousels_project/carousel_demo.dart';

class CarouselDemoModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => CarouselDemo()),
      ];

  static Inject get to => Inject<CarouselDemoModule>.of();
}

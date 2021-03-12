import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/restaurant/cart_page.dart';
import 'package:new_practice/screens/restaurant/resto_details.dart';
import 'package:new_practice/screens/restaurant/resto_page.dart';

class RestoModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => RestoPage()),
        ModularRouter('/details',
            child: (_, args) => RestaurantDetails(restaurant: args.data)),
        ModularRouter('/cart', child: (_, args) => CartPage()),
        //         ModularRouter('/user', module: UserDetails()),
      ];

  static Inject get to => Inject<RestoModule>.of();
}

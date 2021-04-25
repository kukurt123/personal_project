import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/ecommerce_bloc.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_detail.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_main.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_payment.dart';

class EcommerceModule extends ChildModule {
  @override
  List<Bind> get binds => [Bind((i) => EcommerceBloc())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => EcommerceMain()),
        ModularRouter('/details',
            child: (_, args) => EcommerceDetail(
                  fruit: args.data,
                )),
        // ModularRouter('/payment', child: (_, args) => EcommercePayment()),
      ];

  static Inject get to => Inject<EcommerceModule>.of();
}

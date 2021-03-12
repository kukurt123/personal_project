import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/qr/qr_details.dart';
import 'package:new_practice/screens/qr/qr_main.dart';

class QrModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => QrMain()),
        ModularRouter('/details',
            child: (_, args) => QrDetails(firestoreQr: args.data)),
        // ModularRouter('/details', child: (_, args) => QrDetails()),
      ];

  static Inject get to => Inject<QrModule>.of();
}

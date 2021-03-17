import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/screens/uber/login/email-sign-in.dart';
import 'package:new_practice/screens/uber/uber_main.dart';
import 'package:new_practice/services/login_services/firebase/firestore_uber.dart';

class UberModule extends ChildModule {
  @override
  List<Bind> get binds =>
      [Bind((i) => UserHomeBloc()), Bind((i) => FirestoreUber())];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => UberMain()),
        ModularRouter('/email', child: (_, args) => EmailSignIn()),
        // ModularRouter('/home', child: (_, args) => HomeUber()),
        //         ModularRouter('/user', module: UserDetails()),
      ];

  static Inject get to => Inject<UberModule>.of();
}

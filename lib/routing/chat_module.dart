import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/chat_bloc.dart';
import 'package:new_practice/bloc/ecommerce_bloc.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/screens/chat/chat_details.dart';
import 'package:new_practice/screens/chat/chat_home.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_detail.dart';
import 'package:new_practice/screens/ecommerce/ecommerce_main.dart';
import 'package:new_practice/screens/restaurant/cart_page.dart';
import 'package:new_practice/screens/zoom_clone/zoom_home.dart';
import 'package:new_practice/screens/zoom_clone/zoom_intro.dart';
import 'package:new_practice/screens/zoom_clone/zoom_login.dart';
import 'package:new_practice/services/login_services/firebase/firebase_chat.dart';
import 'package:new_practice/services/login_services/firebase/firebase_user.dart';

class ChatModule extends ChildModule {
  @override
  List<Bind> get binds => [
        Bind((i) => ChatBloc()),
        Bind((i) => FirebaseChat()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => ChatHome()),
        ModularRouter('/details', child: (_, args) => ChatDetails()),
        // ModularRouter('/home', child: (_, args) => EcommerceBilling()),
        //         ModularRouter('/user', module: UserDetails()),
      ];

  static Inject get to => Inject<ChatModule>.of();
}

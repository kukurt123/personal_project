import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/social_media/social_home.dart';
import 'package:new_practice/screens/social_media/social_login.dart';
import 'package:new_practice/screens/social_media/social_profile.dart';

class SocialMediaModule extends ChildModule {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, args) => SocialLogin()),
        ModularRouter('/home', child: (_, args) => SocialHome()),
        ModularRouter('/profile', child: (_, args) => SocialProfile()),
      ];

  static Inject get to => Inject<SocialMediaModule>.of();
}

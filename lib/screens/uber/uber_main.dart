import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/models/uber_model/users.dart';
import 'package:new_practice/screens/uber/user/uber_home.dart';
import 'package:new_practice/screens/uber/user/user_home.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'login/sign-in.dart';

class UberMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Modular.get<AuthService>();
    final uberBloc = Modular.get<UberUserBloc>();
    // auth.checkChanges();
    return StreamBuilder<Users>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            Users user = snapshot.data;
            if (user == null) {
              return SignIn();
            }
            return UserHome();
            // return UberHome();
          } else {
            if (uberBloc.isLoaded == true) {
              // return UberHome();
              return UserHome();
            }
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}

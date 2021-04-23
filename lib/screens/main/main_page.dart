import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/screens/login/login.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/widgets/extras.dart';
import 'package:new_practice/widgets/text/text_deco.dart';

import '../main_drawer.dart';
import 'main_intro.dart';

class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool loggedIn = false;
  final auth = Modular.get<AuthService>();
  final mainBloc = Modular.get<MainBloc>();
  var firstLogin = false;
  void change({bool value}) {
    print('changing value');
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (loggedIn != value) {
        setState(() {
          loggedIn = value;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: loggedIn == true ? MainDrawer() : null,
      appBar: loggedIn == true
          ? AppBar(
              title: Text(''),
            )
          : null,
      body: StreamBuilder<dynamic>(
          stream: auth.mainChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              dynamic user = snapshot.data;
              if (user == null || user.toString().length < 5) {
                change(value: false);
                if (mainBloc.openIntro.value == true || firstLogin == true) {
                  return Login();
                }
                return MainIntro();
              } else {
                auth.currentUser().then((x) {
                  mainBloc.changeUser(x);
                });
                // mainBloc.openIntro.add(true);

                return _main(context);
              }
            }
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }),
    );
  }

  Widget _main(BuildContext context) {
    firstLogin = true;
    change(value: true);
    return Container(
      color: Theme.of(context).primaryColor,
      child: Center(
          child: Text("Kurt's Sample Projects",
              style: TextStyle1(size: 30, color: Colors.white, isBold: true))),
    );
  }
}

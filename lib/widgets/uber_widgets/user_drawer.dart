import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/utils/alert-dialog/alert-dialogs.dart';
import 'package:new_practice/widgets/extras.dart';

class UserDrawer extends StatefulWidget {
  UserDrawer({Key key}) : super(key: key);

  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  final List<String> texts = <String>['Main', 'Page1', 'Page2'];
  final List<bool> isHighlighted = [true, false, false];

  @override
  Widget build(BuildContext context) {
    final uberUserBloc = Modular.get<UberUserBloc>();
    final auth = Modular.get<AuthService>();
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // child: GestureDetector(
                    //   onTap: () {
                    //     print('clicked....');
                    //     Modular.to.pushNamed('/social/profile');
                    //   },
                    // ),
                    decoration: BoxDecoration(
                        // image: DecorationImage(
                        //     fit: BoxFit.cover, image: AssetImage(null)),
                        border: Border.all(width: 5, color: Colors.white),
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'test',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          DrawerListItem(
              icon: Icons.zoom_in, text: 'Profile', routeName: '/profile'),
          DrawerListItem(
              icon: Icons.zoom_in, text: 'History', routeName: '/history'),
          ListTile(
            title: Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text('Logout'),
                )
              ],
            ),
            onTap: () {
              confirmDialogUtil(
                  context, ['Logout', 'Are you sure you want to logout?'], () {
                Navigator.pop(context);
                uberUserBloc.isLoaded = false;
                auth.signOut();
              });
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/bloc/page1_1/page1_1_barrel.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:new_practice/services/firebase_messaging/firebase_messaging_background_handler.dart';
import 'package:new_practice/widgets/extras.dart';

class MainDrawer extends StatelessWidget {
  MainDrawer({widget, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(child: DrawerMain());
  }
}

class DrawerMain extends StatefulWidget {
  DrawerMain({Key key}) : super(key: key);

  @override
  _DrawerMainState createState() => _DrawerMainState();
}

class _DrawerMainState extends State<DrawerMain> {
  final List<String> texts = <String>['Main', 'Page1', 'Page2'];
  final List<bool> isHighlighted = [true, false, false];

  @override
  Widget build(BuildContext context) {
    final mainBloc = Modular.get<MainBloc>();
    return Container(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: StreamBuilder(
                stream: mainBloc.currentUser.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError || snapshot.hasData == false) {
                    return Container(child: Text('has erorr'));
                  }
                  SocialUser user = snapshot.data;
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          child: GestureDetector(
                            onTap: () {
                              print('clicked....');
                              Modular.to.pushNamed('/social/profile');
                            },
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(user.profileImageUrl)),
                              border: Border.all(width: 5, color: Colors.white),
                              shape: BoxShape.circle),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            user.name,
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          DrawerListItem(
              icon: Icons.qr_code, text: 'Qr Codes', routeName: '/qr'),
          DrawerListItem(
              icon: Icons.directions_bike,
              text: 'Uber Clone',
              routeName: '/uber'),
          DrawerListItem(
              icon: Icons.zoom_in,
              text: 'Zoom Clone',
              routeName: '/zoom_clone'),
          DrawerListItem(
              icon: Icons.person,
              text: 'Instagram Clone',
              routeName: '/social'),
          DrawerListItem(
              icon: Icons.food_bank_rounded,
              text: 'Food Panda Clone',
              routeName: '/resto'),
          DrawerListItem(
              icon: Icons.login,
              text: 'Pretty Login Design',
              routeName: '/login'),
          DrawerListItem(
              icon: Icons.view_carousel_rounded,
              text: 'Carousel Designs',
              routeName: '/carousel_demo'),
          DrawerListItem(
            icon: Icons.home,
            text: 'Home Page',
            routeName: '/home',
            withFunc: true,
            onTap: () {
              mainBloc.firebaseOnMessage();
            },
          ),
          DrawerListItem(
            icon: Icons.folder,
            text: 'Page 1',
            routeName: '/page1',
            withFunc: true,
            onTap: () {
              mainBloc.sendPushMessage();
              Modular.get<Page1Bloc>().add(Page1EventSummary());
            },
          ),
          DrawerListItem(
              icon: Icons.folder_rounded, text: 'Page 2', routeName: '/page2')
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/utils/alert-dialog/alert-dialogs.dart';
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
  final List<bool> isHighlighted = [true, false, false];
  final List<String> texts = <String>['Main', 'Page1', 'Page2'];

  @override
  Widget build(BuildContext context) {
    final mainBloc = Modular.get<MainBloc>();
    final uberUserBloc = Modular.get<UberUserBloc>();
    final auth = Modular.get<AuthService>();
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // GestureDetector(
                        //   onTap: () {
                        //     // pt('clicked.... ${Modular.navigator.path} ${Modular.navigatorKey.currentWidget}');

                        //     Modular.link.pushNamed('social/profile');
                        //   },
                        //   child: ImageWithState(
                        //     futureUrl: imageUrlAsFuture(user.profileImageUrl),
                        //     boxShape: BoxShape.circle,
                        //     height: 50,
                        //     width: 50,
                        //   ),
                        // ),
                        Container(
                          height: 80,
                          width: 80,
                          child: GestureDetector(
                            onTap: () {
                              Modular.link.pushNamed('social/profile');
                            },
                          ),
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(user.profileImageUrl)),
                              border: Border.all(width: 2, color: Colors.white),
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
              icon: Icons.maps_ugc, text: 'Chat UI', routeName: '/chat'),
          DrawerListItem(
              icon: Icons.local_grocery_store,
              text: 'Ecommerce UI',
              routeName: '/ecommerce'),
          DrawerListItem(
              icon: Icons.qr_code, text: 'Qr Code UI', routeName: '/qr'),
          DrawerListItem(
            icon: Icons.map_outlined,
            text: 'Maps UI',
            routeName: '/uber',
            withFunc: true,
            onTap: () async {},
          ),
          DrawerListItem(
              icon: Icons.zoom_in,
              text: 'Zoom Clone',
              routeName: '/zoom_clone'),
          DrawerListItem(
              icon: Icons.person, text: 'Social UI', routeName: '/social'),
          DrawerListItem(
              icon: Icons.food_bank_rounded,
              text: 'Food ordering UI',
              routeName: '/resto'),
          DrawerListItem(
              icon: Icons.policy_outlined,
              text: 'Privacy Policy',
              routeName: '/policy'),
          // DrawerListItem(
          //     icon: Icons.login,
          //     text: 'Pretty Login Design',
          //     routeName: '/login'),
          // DrawerListItem(
          //     icon: Icons.view_carousel_rounded,
          //     text: 'Carousel Designs',
          //     routeName: '/carousel_demo'),
          // DrawerListItem(
          //   icon: Icons.home,
          //   text: 'Home Page',
          //   routeName: '/home',
          //   withFunc: true,
          //   onTap: () {
          //     mainBloc.firebaseOnMessage();
          //   },
          // ),
          // DrawerListItem(
          //   icon: Icons.folder,
          //   text: 'Page 1',
          //   routeName: '/page1',
          //   withFunc: true,
          //   onTap: () {
          //     mainBloc.sendPushMessage();
          //     Modular.get<Page1Bloc>().add(Page1EventSummary());
          //   },
          // ),
          // DrawerListItem(
          //     icon: Icons.folder_rounded, text: 'Page 2', routeName: '/page2'),
          //
          // DrawerListItem(
          //     icon: Icons.info_sharp, text: 'About Kurt', routeName: '/about'),
          // DrawerListItem(
          //     icon: Icons.contact_phone_rounded,
          //     text: 'Contact Kurt',
          //     routeName: '/contact'),
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
                Navigator.pop(context);
                // Navigator.of(context, rootNavigator: true).pop();
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

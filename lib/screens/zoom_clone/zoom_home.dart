import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/screens/zoom_clone/zoom_profile.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

import 'conference.dart';

class ZoomHome extends StatefulWidget {
  ZoomHome({Key key}) : super(key: key);

  @override
  _ZoomHomeState createState() => _ZoomHomeState();
}

class _ZoomHomeState extends State<ZoomHome> {
  PersistentTabController _controller;

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      _controller = PersistentTabController(initialIndex: 0);
    }
  }

  List<Widget> _buildScreens() {
    return [Conference(), ZoomProfile()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.video_camera),
        title: ("Video Call"),
        // activeColor: CupertinoColors.activeBlue,
        // inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.person_add_solid),
        title: ("Profile"),
        // activeColor: CupertinoColors.activeBlue,
        // inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Navigation Bar Demo')),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(),
        items: _navBarsItems(),
        confineInSafeArea: true,
        // backgroundColor: Colors.white,
        // handleAndroidBackButtonPress: true,
        resizeToAvoidBottomInset: true,
        // stateManagement: true,
        navBarHeight: MediaQuery.of(context).viewInsets.bottom > 0
            ? 0.0
            : kBottomNavigationBarHeight,
        hideNavigationBarWhenKeyboardShows: true,
        margin: EdgeInsets.all(10.0),
        popActionScreens: PopActionScreensType.once,
        bottomScreenMargin: 0.0,
        // routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //   initialRoute: '/',
        //   routes: {
        //     '/first': (context) => Container(
        //           child: Text('YEYEYEY'),
        //         ),
        //     '/second': (context) => Container(
        //           child: Text('safdsfY'),
        //         ),
        //   },
        // ),
        // onWillPop: () async {
        //   await showDialog(
        //     context: context,
        //     useSafeArea: true,
        //     builder: (context) => Container(
        //       height: 50.0,
        //       width: 50.0,
        //       color: Colors.white,
        //       child: RaisedButton(
        //         child: Text("Close"),
        //         onPressed: () {
        //           Navigator.pop(context);
        //         },
        //       ),
        //     ),
        //   );
        //   return false;
        // },
        selectedTabScreenContext: (context) {
          // testContext = context;
        },
        // hideNavigationBar: _hideNavBar,
        // decoration: NavBarDecoration(
        //     colorBehindNavBar: Colors.indigo,
        //     borderRadius: BorderRadius.circular(20.0)),
        popAllScreensOnTapOfSelectedTab: true,
        // itemAnimationProperties: ItemAnimationProperties(
        //   duration: Duration(milliseconds: 100),
        //   curve: Curves.ease,
        // ),
        // screenTransitionAnimation: ScreenTransitionAnimation(
        //   animateTabTransition: true,
        //   curve: Curves.ease,
        //   duration: Duration(milliseconds: 100),
        // ),
        navBarStyle:
            NavBarStyle.style8, // Choose the nav bar style with this property
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/qr/qr_create.dart';
import 'package:new_practice/screens/qr/qr_list.dart';
import 'package:new_practice/screens/qr/qr_read.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/services/login_services/firebase/firebase-qr.dart/firestore_qr.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';

class QrMain extends StatefulWidget {
  QrMain({Key key}) : super(key: key);

  @override
  _QrMainState createState() => _QrMainState();
}

class _QrMainState extends State<QrMain> {
  PersistentTabController _controller;
  final auth = Modular.get<AuthService>();

  @override
  void initState() {
    if (this.mounted) {
      super.initState();
      _controller = PersistentTabController(initialIndex: 0);
    }
  }

  List<Widget> _buildScreens(FirestoreQr firestoreQr) {
    return [
      QrCreate(
        firestoreQr: firestoreQr,
      ),
      QrList(
        firestoreQr: firestoreQr,
      ),
      QrRead(
        firestoreQr: firestoreQr,
      )
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.create),
        title: ("Create"),
        // activeColor: CupertinoColors.activeBlue,
        // inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.list_dash),
        title: ("List"),
        // activeColor: CupertinoColors.activeBlue,
        // inactiveColor: CupertinoColors.systemGrey,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.qrcode),
        title: ("Qr"),
        // activeColor: CupertinoColors.activeBlue,
        // inactiveColor: CupertinoColors.systemGrey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final FirestoreQr firestoreQr = FirestoreQr(uid: auth.getCurrentUserId());
    return Scaffold(
      // appBar: AppBar(title: const Text('Navigation Bar Demo')),
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: _buildScreens(firestoreQr),
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

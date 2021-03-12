import 'package:flutter/material.dart';
import 'package:new_practice/screens/page1_1.dart';
import 'package:new_practice/screens/page2.dart';

class ProperMainHome extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ProperMainHome> {
  PageController _pageController;
  int _page = 0;

  List drawerItems = [
    {
      "icon": Icons.add,
      "name": "New Post",
    },
    {
      "icon": Icons.delete,
      "name": "Delete Post",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Drawers demo"),
      // ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text(
                "DRAWER HEADER..",
                style: TextStyle(color: Colors.white),
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: drawerItems.length,
              itemBuilder: (BuildContext context, int index) {
                Map item = drawerItems[index];
                return ListTile(
                  leading: Icon(
                    item['icon'],
                    color: _page == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).textTheme.title.color,
                  ),
                  title: Text(
                    item['name'],
                    style: TextStyle(
                      color: _page == index
                          ? Theme.of(context).primaryColor
                          : Theme.of(context).textTheme.title.color,
                    ),
                  ),
                  onTap: () {
                    _pageController.jumpToPage(index);
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ],
        ),
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Page1_1(),
          Page2(),
        ],
      ),
    );
  }

  void navigationTapped(int page) {
    _pageController.jumpToPage(page);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }
}

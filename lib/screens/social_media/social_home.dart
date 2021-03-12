import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/mock_data/social_media.dart';
import 'package:new_practice/models/social_media/socialuser.dart';
import 'package:new_practice/screens/main_drawer.dart';
import 'package:new_practice/widgets/carousel_animation.dart';

class SocialHome extends StatefulWidget {
  const SocialHome({Key key}) : super(key: key);

  @override
  _SocialHomeState createState() => _SocialHomeState();
}

class _SocialHomeState extends State<SocialHome>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;
  PageController _animationController;
  Listenable anime;

  final tab = new TabBar(
    tabs: <Widget>[
      Tab(
        child: Text('Latest'),
      ),
      Tab(
        child: Text('Trending'),
      ),
    ],
  );

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 8.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.white,
        brightness: Brightness.light,
        centerTitle: true,
        title: Text(
          'FRENZY',
          style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 8),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelStyle: TextStyle(fontSize: 18.0),
          unselectedLabelStyle: TextStyle(fontSize: 18.0),
          unselectedLabelColor: Colors.grey,
          labelColor: Theme.of(context).primaryColor,
          tabs: [Tab(text: 'Trending'), Tab(text: 'Latest')],
        ),
      ),
      body: ListView(
        children: <Widget>[
          followingWidget(),
          Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Posts',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          CarouselAnimation(posts: posts),
        ],
      ),
    );
  }
}

Column followingWidget() {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Following',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      Container(
        height: 80.0,
        child: ListView.builder(
          padding: EdgeInsets.only(left: 10.0),
          scrollDirection: Axis.horizontal,
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            SocialUser user = users[index];
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.all(10.0),
                width: 65,
                height: 65,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 2),
                      blurRadius: 6.0,
                    ),
                  ],
                  border: Border.all(
                      width: 2, color: Theme.of(context).primaryColor),
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(user.profileImageUrl),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      // Padding(
      //   padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
      //   child: Align(
      //     alignment: Alignment.centerLeft,
      //     child: Text(
      //       'Posts',
      //       style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
      //     ),
      //   ),
      // ),
    ],
  );
}

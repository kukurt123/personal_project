import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_practice/mock_data/restaurant_data.dart';
import 'package:new_practice/models/restaurant.dart';
import 'package:new_practice/screens/restaurant/resto_list.dart';
import 'package:new_practice/screens/restaurant/resto_details.dart';
import 'package:new_practice/widgets/search_bar_resto.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

class EcommerceMain extends StatefulWidget {
  EcommerceMain({Key key}) : super(key: key);

  @override
  EcommerceMainState createState() => EcommerceMainState();
}

class EcommerceMainState extends State<EcommerceMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            elevation: 10.0,
            expandedHeight: 50.0,
            floating: true,
            pinned: false,
            snap: true,
            leading: IconButton(
                icon: Icon(Icons.account_circle),
                iconSize: 30.0,
                onPressed: () {}),
            backgroundColor: Colors.grey[200],
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: false,
              // titlePadding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              title: Text(
                "Fruits and vegetables",
                style: TextStyle1(size: 2.5.h, color: Colors.white),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.sort),
                onPressed: () {},
              )
            ],
          )
        ];
      },
      body:
          // crossAxisAlignment: CrossAxisAlignment.start,
          Stack(children: [
        Positioned(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Nearby Restaurants',
              style: TextStyle(
                  fontSize: 3.0.h,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2),
            ),
          ),
        ),
        StaggeredGridView.countBuilder(
          crossAxisCount: 4,
          // padding: EdgeInsets.all(10),
          itemCount: 20,
          itemBuilder: (BuildContext context, int index) => new Container(
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10.0)),
            child: Text('text'),
          ),
          staggeredTileBuilder: (int index) => new StaggeredTile.count(2, 2),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        Positioned(
          bottom: 0,
          // top: 0,
          // width: 0,
          // width: double.infinity,
          // top: ,
          // left: 10,
          // bottom: 0,
          child: Container(
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.local_grocery_store_outlined,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              color: Colors.black,
              height: 10.0.h,
              width: MediaQuery.of(context).size.width),
        )
      ]),
      // InkWell(
      //   onTap: () {
      //     // Navigator.pop(context);
      //     Modular.to.pushReplacementNamed('/home');
      //   },
      //   child: Container(
      //     height: 100,
      //     child: Center(child: Text('Main Menu')),
      //   ),
      // ),
    ));
  }
}

_buildRestaurants(BuildContext context) {
  List<Widget> restaurantList = [];
  restaurants.forEach((Restaurant restaurant) {
    restaurantList.add(
      GestureDetector(
        onTap: () => {
          // Navigator.pop(context
          Modular.link.pushNamed('/details', arguments: restaurant)
        },
        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (_) => restaurant.name.contains('ers')
        //           ? DetailPage(
        //               index: 10,
        //               restaurant: restaurant,
        //             )
        //           : RestaurantDetails(restaurant: restaurant)),
        // ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15.0),
            border: Border.all(
              width: 1.0,
              color: Colors.grey[200],
            ),
          ),
          child: Row(
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Hero(
                  tag: restaurant.imageUrl,
                  child: Image(
                    height: 150.0,
                    width: 150.0,
                    image: AssetImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      // RatingStars(restaurant.rating),
                      SizedBox(height: 4.0),
                      Text(
                        restaurant.address,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  });
  return Column(children: restaurantList);
}

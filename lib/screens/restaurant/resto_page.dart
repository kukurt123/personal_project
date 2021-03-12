import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/mock_data/restaurant_data.dart';
import 'package:new_practice/models/restaurant.dart';
import 'package:new_practice/screens/restaurant/resto_list.dart';
import 'package:new_practice/screens/restaurant/resto_details.dart';
import 'package:new_practice/widgets/search_bar_resto.dart';

class RestoPage extends StatefulWidget {
  RestoPage({Key key}) : super(key: key);

  @override
  RestoPageState createState() => RestoPageState();
}

class RestoPageState extends State<RestoPage> {
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
              backgroundColor: Colors.deepOrange,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("Restaurants"),
              ),
              actions: <Widget>[
                FlatButton(
                  child: Text(
                    'Cart (${currentUser.cart.length})',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  onPressed: () {
                    Modular.link.pushNamed('/cart');
                  },
                )
              ],
            )
          ];
        },
        body: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            SearchForm(),
            RecentOrders(),
            // RestoList(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    'Nearby Restaurants',
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2),
                  ),
                ),
                _buildRestaurants(context),
              ],
            ),
            InkWell(
              onTap: () {
                // Navigator.pop(context);
                Modular.to.pushReplacementNamed('/main');
              },
              child: Container(
                height: 100,
                child: Center(child: Text('Main Menu')),
              ),
            ),
          ],
        ),
      ),
    );
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

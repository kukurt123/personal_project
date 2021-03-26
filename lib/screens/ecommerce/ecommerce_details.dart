import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_practice/models/food.dart';
import 'package:new_practice/models/restaurant.dart';

class EcommerceDetails extends StatefulWidget {
  final Restaurant restaurant;

  EcommerceDetails({this.restaurant});

  @override
  _EcommerceDetailsState createState() => _EcommerceDetailsState();
}

class _EcommerceDetailsState extends State<EcommerceDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Image(
                  height: 350.0,
                  width: MediaQuery.of(context).size.width,
                  image: AssetImage(widget.restaurant.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Theme.of(context).primaryColor,
                      iconSize: 35.0,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '0.2 miles away',
                      style: TextStyle(
                        fontSize: 18.0,
                      ),
                    ),
                  ],
                ),
                // RatingStars(widget.restaurant.rating),
                SizedBox(height: 6.0),
                Text(
                  widget.restaurant.address,
                  style: TextStyle(fontSize: 18.0),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Reviews',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                padding: EdgeInsets.symmetric(horizontal: 30.0),
                color: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Text(
                  'Contact',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Center(
            child: Text(
              'Menu',
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 1.2,
              ),
            ),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(widget.restaurant.menu.length, (index) {
                Food food = widget.restaurant.menu[index];
                return _buildMenuItem(food, context);
              }),
            ),
          )
        ],
      ),
    );
  }
}

_buildMenuItem(Food menuItem, BuildContext context) {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(menuItem.imageUrl),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        Container(
          height: 175.0,
          width: 175.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.black.withOpacity(0.3),
                Colors.black87.withOpacity(0.3),
                Colors.black54.withOpacity(0.3),
                Colors.black38.withOpacity(0.3),
              ],
              stops: [0.1, 0.4, 0.6, 0.9],
            ),
          ),
        ),
        Positioned(
          bottom: 65.0,
          child: Column(
            children: <Widget>[
              Text(
                menuItem.name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              Text(
                '\$${menuItem.price}',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 10.0,
          right: 10.0,
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(30.0),
            ),
            child: IconButton(
              icon: Icon(Icons.add),
              iconSize: 30.0,
              color: Colors.white,
              onPressed: () {},
            ),
          ),
        ),
      ],
    ),
  );
}

class DetailPage extends StatefulWidget {
  final Restaurant restaurant;
  final index;

  DetailPage({this.index, this.restaurant});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final double expandedHeight = 400;
  final double roundedCountainerHeight = 50;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            _buildSliverHeader(),
            SliverToBoxAdapter(
              child: buildDetail(),
            )
          ],
        ),
        // Hero(
        //   tag: widget.restaurant.imageUrl,
        //   child: Image(
        //     height: 220.0,
        //     width: MediaQuery.of(context).size.width,
        //     image: AssetImage(widget.restaurant.imageUrl),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                iconSize: 30.0,
                onPressed: () => Navigator.pop(context),
              ),
              IconButton(
                icon: Icon(Icons.favorite),
                color: Theme.of(context).primaryColor,
                iconSize: 35.0,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ],
    ));
  }

  Widget _buildSliverHeader() {
    return SliverPersistentHeader(
      delegate: DetailSliverDelegate(
        expandedHeight,
        roundedCountainerHeight,
        widget.index,
      ),
    );
  }
}

class buildDetail extends StatefulWidget {
  final Restaurant restaurant;
  buildDetail({Key key, this.restaurant}) : super(key: key);

  @override
  _buildDetailState createState() => _buildDetailState();
}

class _buildDetailState extends State<buildDetail> {
  Widget _buildDetail(Restaurant restaurant) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            child: GridView.count(
              padding: EdgeInsets.all(10.0),
              crossAxisCount: 2,
              children: List.generate(restaurant.menu.length, (index) {
                Food food = restaurant.menu[index];
                return _buildMenuItem(food, context);
              }),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(child: _buildDetail(widget.restaurant)),
    );
  }
}

class DetailSliverDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double roundedContainerHeight;
  final index;

  DetailSliverDelegate(
      this.expandedHeight, this.roundedContainerHeight, this.index);

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapContent) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark,
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark),
      child: Hero(
        tag: index,
        child: Stack(
          children: <Widget>[
            Image.asset('assets/images/resto2.jpg',
                width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
            Positioned(
              top: expandedHeight - roundedContainerHeight - shrinkOffset,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: roundedContainerHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'test',
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '0.2 miles away',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ],
                  ),
                  // RatingStars(widget.restaurant.rating),
                  SizedBox(height: 6.0),
                  Text(
                    'test',
                    style: TextStyle(fontSize: 18.0),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {},
                ),
                FlatButton(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  color: Theme.of(context).primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Text(
                    'Contact',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Center(
              child: Text(
                'Menu',
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.2,
                ),
              ),
            ),
            SizedBox(height: 10.0),
            // Positioned(
            //   top: expandedHeight - 120 - shrinkOffset,
            //   left: 30,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: <Widget>[
            //       Text(
            //         'tester',
            //         style: TextStyle(color: Colors.white, fontSize: 30),
            //       ),
            //       Text(
            //         'tester',
            //         style: TextStyle(color: Colors.white, fontSize: 30),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => expandedHeight;

  @override
  // TODO: implement minExtent
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

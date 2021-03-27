import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:new_practice/bloc/ecommerce_bloc.dart';
import 'package:new_practice/mock_data/ecommerce_data.dart';
import 'package:new_practice/mock_data/restaurant_data.dart';
import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/models/ecommerce/fruit_total.dart';
import 'package:new_practice/models/restaurant.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

class EcommerceMain extends StatefulWidget {
  EcommerceMain({Key key}) : super(key: key);
  final ecommerceBloc = Modular.get<EcommerceBloc>();

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
        // Positioned(
        //   // bottom: 0,
        //   child: Padding(
        //     padding: EdgeInsets.fromLTRB(2.0.w, 3.0.h, 2.0.w, 5.0.h),
        //     child: Text(
        //       'Nearby Restaurants',
        //       style: TextStyle(
        //           fontSize: 3.0.h,
        //           fontWeight: FontWeight.w600,
        //           letterSpacing: 1.2),
        //     ),
        //   ),
        // ),
        StaggeredGridView.countBuilder(
          padding: EdgeInsets.fromLTRB(5, 2.0.h, 5, 10.0.h),
          crossAxisCount: 4,
          // padding: EdgeInsets.all(10),
          itemCount: fruits.length,
          itemBuilder: (BuildContext context, int index) => new Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10.0)),
            child: fruitContent(fruits[index]),
          ),
          staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(2, 0.32.h),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        // Positioned(
        //   bottom: 0,
        //   child: ClipPath(
        //     clipper: CurvedClipperTop(),
        //     child: Container(
        //         child: _cartContainer(),
        //         color: Colors.black,
        //         height: 10.0.h,
        //         width: MediaQuery.of(context).size.width),
        //   ),
        // )
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

  Widget _cartContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              Icons.local_grocery_store_outlined,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
          StreamBuilder(
              stream: widget.ecommerceBloc.fruitListStream.stream,
              builder: (context, snapshot) {
                return _basketContainer();
              })
        ],
      ),
    );
  }

  Widget _basketContainer() {
    return ListView.builder(
      padding: EdgeInsets.only(left: 10.0),
      scrollDirection: Axis.horizontal,
      itemCount: widget.ecommerceBloc.cartGrouped.length,
      itemBuilder: (BuildContext context, int index) {
        FruitTotal fruit = widget.ecommerceBloc.cartGrouped[index];
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
              border:
                  Border.all(width: 2, color: Theme.of(context).primaryColor),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(fruit.imageLocation),
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget fruitContent(Fruit fruit) {
  return GestureDetector(
    onTap: () {
      Modular.link.pushNamed('/details', arguments: fruit);
    },
    child: Padding(
      padding: EdgeInsets.all(15),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: fruit.image,
              child: Image(
                height: 13.0.h,
                // width: 10.0.w,
                image: AssetImage(fruit.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 1.0.h),
          Text('P${fruit.price}', style: TextStyle1(size: 2.5.h, isBold: true)),
          SizedBox(height: 0.3.h),
          Text('${fruit.name}', style: TextStyle1(size: 1.5.h, isBold: true)),
          SizedBox(height: 0.3.h),
          Expanded(
            child: Text('${fruit.gram}',
                style: TextStyle1(
                  size: 1.5.h,
                )),
          ),
        ],
      ),
    ),
  );
}

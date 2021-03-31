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
import 'package:rxdart/rxdart.dart';
import 'package:sizer/sizer.dart';

import 'ecommerce_billing.dart';

class EcommerceMain extends StatefulWidget {
  EcommerceMain({Key key}) : super(key: key);
  final ecommerceBloc = Modular.get<EcommerceBloc>();
  var deleteHeroKey = BehaviorSubject<bool>.seeded(false);

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
            backgroundColor: Colors.grey[800],
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
      body: Stack(children: [
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
        Positioned(
          bottom: 0,
          child: ClipPath(
            clipper: CurvedClipperTop(),
            child: Container(
                child: _cartContainer(),
                color: Colors.black,
                height: 10.0.h,
                width: MediaQuery.of(context).size.width),
          ),
        ),
      ]),
    ));
  }

  Widget _cartContainer() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            width: 2.0.w,
          ),
          IconButton(
            icon: Icon(
              Icons.local_grocery_store_outlined,
              color: Colors.white,
            ),
            onPressed: () {
              print('showButtonSheet....');
              showButtonSheet(context);
            },
          ),
          StreamBuilder(
              stream: widget.ecommerceBloc.fruitListStream.stream,
              builder: (context, snapshot) {
                if (widget.ecommerceBloc.cartGrouped.length != 0) {
                  return Expanded(child: _basketContainer());
                  // return Text('test', style: TextStyle(color: Colors.red));
                }
                return Text('',
                    style: TextStyle(color: Theme.of(context).primaryColor));
              }),
          SizedBox(
            width: 4.0.w,
          ),
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
        print('ecommerce main...' +
            fruit.imageLocation +
            widget.ecommerceBloc.heroTag);
        return Dismissible(
          key: Key(fruit.totalId),
          onDismissed: (direction) {
            print('onDismissed');

            widget.ecommerceBloc.removeCartGrouped(fruit);
            widget.deleteHeroKey.add(false);
          },
          onResize: () {
            widget.deleteHeroKey.sink.add(true);
            print('onResize...');
          },
          secondaryBackground:
              Icon(Icons.delete_forever_sharp, color: Colors.red),
          background: Expanded(
              child: Container(
            child:
                Text('sdaf jdsalfk jsd', style: TextStyle1(color: Colors.blue)),
            color: Colors.red,
          )),
          resizeDuration: Duration(seconds: 1),
          direction: DismissDirection.up,
          child: StreamBuilder<bool>(
              stream: widget.deleteHeroKey.stream,
              builder: (context, snapshot) {
                print('snapshot data' + snapshot.data.toString());
                return Hero(
                  tag: fruit.imageLocation +
                      (snapshot.data == true
                          ? ''
                          : widget.ecommerceBloc.heroTag ?? ''),
                  child: Stack(children: [
                    Positioned(
                      top: 0,
                      child: Text(
                        '${fruit.qty}',
                        style: TextStyle1(
                          color: Colors.white,
                          size: 2.5.h,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(2.0),
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
                        border: Border.all(width: 2, color: Colors.white),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(fruit.imageLocation),
                        ),
                      ),
                    ),
                  ]),
                );
              }),
        );
      },
    );
  }

  Widget fruitContent(Fruit fruit) {
    return GestureDetector(
      onTap: () {
        widget.ecommerceBloc.heroTag = '';
        print('heroTag...' + widget.ecommerceBloc.heroTag ?? '');
        Modular.link.pushNamed('/details', arguments: fruit);
      },
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
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
            Text('P${fruit.price.round()}',
                style: TextStyle1(size: 2.5.h, isBold: true)),
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
}

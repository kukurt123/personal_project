import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class EcommerceDetail extends StatefulWidget {
  final Fruit fruit;
  EcommerceDetail({Key key, this.fruit}) : super(key: key);

  @override
  _EcommerceDetailState createState() => _EcommerceDetailState();
}

class _EcommerceDetailState extends State<EcommerceDetail> {
  @override
  Widget build(BuildContext context) {
    Fruit fruit = widget.fruit;
    return Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.white,
        //   elevation: 0,
        //   iconTheme: IconThemeData(
        //     color: Colors.black,
        //   ),
        // ),
        bottomSheet: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(width: 4.0.w),
                RaisedButton(
                  shape: CircleBorder(),
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.red,
                  ),
                  onPressed: () {},
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.0.h),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.red)))),
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart_outlined),
                          SizedBox(width: 20),
                          Text('Add to cart'),
                        ],
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
            color: Colors.white,
            height: 10.0.h,
            width: MediaQuery.of(context).size.width),
        body: Center(
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: Colors.white,
                expandedHeight: MediaQuery.of(context).size.height / 2,
                flexibleSpace: FlexibleSpaceBar(
                  background: Hero(
                    tag: fruit.id,
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image(
                          height: 13.0.h,
                          // width: 10.0.w,
                          image: AssetImage(fruit.image),
                          fit: BoxFit.contain,
                        ),
                        Positioned(
                          top: 4.5.h,
                          left: 0.0.w,
                          // right: 0.0.w,
                          child: RaisedButton(
                            shape: CircleBorder(),
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.red,
                              // size: 3.0.h,
                            ),
                            onPressed: () {},
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              SliverFixedExtentList(
                itemExtent: MediaQuery.of(context).size.height / 2,
                delegate: SliverChildListDelegate([
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${fruit.name}',
                              style: TextStyle1(isBold: true, size: 3.5.h)),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text('${fruit.gram}',
                              style: TextStyle1(color: Colors.grey[500])),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                height: 12.0.h,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: StepperSwipe(
                                    initialValue: 0,
                                    iconsColor: Colors.black,
                                    withFastCount: true,
                                    withSpring: true,
                                    withBackground: true,
                                    stepperValue: fruit.fruitQty,
                                    speedTransitionLimitCount:
                                        3, //Trigger count for fast counting
                                    onChanged: (int value) =>
                                        print('new value $value'),
                                    firstIncrementDuration: Duration(
                                        milliseconds:
                                            300), //Unit time before fast counting
                                    secondIncrementDuration: Duration(
                                        milliseconds:
                                            100), //Unit time during fast counting
                                    direction: Axis.horizontal,
                                    dragButtonColor: Colors.blueAccent,
                                    maxValue: 1000,
                                    minValue: 1,
                                  ),
                                ),
                              ),
                              Text('P${fruit.price}',
                                  style: TextStyle1(isBold: true, size: 3.5.h)),
                            ],
                          ),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text('About the product',
                              style: TextStyle1(isBold: true, size: 2.5.h)),
                          SizedBox(
                            height: 2.0.h,
                          ),
                          Text('Info of the pruduct....'),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/ecommerce_bloc.dart';
import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class ChatDetails extends StatefulWidget {
  final Fruit fruit;
  ChatDetails({Key key, this.fruit}) : super(key: key);

  @override
  _ChatDetailsState createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final ecommerceBloc = Modular.get<EcommerceBloc>();

  @override
  Widget build(BuildContext context) {
    Fruit fruit = widget.fruit;
    int qtyCount = 1;
    return Scaffold(
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
                      onPressed: () {
                        Fruit fruitNew =
                            fruit.copyWith.call(fruitQty: qtyCount);
                        ecommerceBloc.addCartGrouped(fruitNew);
                        ecommerceBloc.heroTag = fruitNew.id;
                        Navigator.pop(context);
                      },
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
                  background: Stack(
                    fit: StackFit.expand,
                    children: [
                      StreamBuilder(
                          stream: ecommerceBloc.fruitListStream.stream,
                          builder: (context, snapshot) {
                            return Hero(
                              tag: fruit.image + ecommerceBloc.heroTag ?? '',
                              child: Image(
                                height: 13.0.h,
                                // width: 10.0.w,
                                image: AssetImage(fruit.image),
                                fit: BoxFit.contain,
                              ),
                            );
                          }),
                      Positioned(
                        top: 4.5.h,
                        left: 0.0.w,
                        child: RaisedButton(
                          shape: CircleBorder(),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      )
                    ],
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
                                    initialValue: 1,
                                    iconsColor: Colors.black,
                                    withFastCount: true,
                                    withSpring: true,
                                    withBackground: true,
                                    stepperValue: fruit.fruitQty,
                                    speedTransitionLimitCount:
                                        3, //Trigger count for fast counting
                                    onChanged: (int value) => qtyCount = value,
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
                              Text('P${fruit.price.round()}',
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/ecommerce_bloc.dart';
import 'package:new_practice/models/ecommerce/fruit_total.dart';
import 'package:new_practice/utils/popup_menu/show_modal_bottom.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

void showButtonSheet(BuildContext context) {
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final requestController = TextEditingController();
  final paymentController = TextEditingController();
  final nameController = TextEditingController();
  final ecommerceBloc = Modular.get<EcommerceBloc>();
  var total = 0.0;

  Widget itemLists() {
    double dob = MediaQuery.of(context).size.height * .50;
    return Container(
      height: dob,
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        itemCount: ecommerceBloc.cartGrouped.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            color: Colors.black12,
            height: 2.0,
          );
        },
        itemBuilder: (BuildContext context, int index) {
          // if (index < currentUser.cart.length) {
          FruitTotal fruit = ecommerceBloc.cartGrouped[index];
          total += fruit.totalPrice;
          return Container(
            margin: EdgeInsets.all(10),
            height: 50,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                      image: AssetImage(fruit.imageLocation),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 6.0.w,
                      ),
                      Text('${fruit.qty}     x',
                          style: TextStyle1(
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 6.0.w,
                      ),
                      Text('${fruit.totalName}',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      SizedBox(
                        width: 8.0.w,
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('P${fruit.totalPrice.round()}',
                              style: TextStyle1(
                                color: Colors.grey[200],
                              )),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
          // }
          // return Padding(
          //   padding: const EdgeInsets.all(25.0),
          //   child: Column(children: <Widget>[
          //     Row(children: [],)
          //   ]),
          // );
        },
      ),
    );
  }

  Widget guideLines() {
    return Container(
      margin: EdgeInsets.all(10),
      // height: 50,
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Icon(
            Icons.car_rental,
            color: Colors.grey[300],
          ),
          SizedBox(
            width: 6.0.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Delivery',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 2.0.h,
                    )),
                SizedBox(
                  width: 2.0.w,
                ),
                Text('free delivery when reached minimum P100 total order',
                    style: TextStyle1(
                      color: Colors.grey[500],
                      size: 1.5.h,
                    )),
              ],
            ),
          ),
          SizedBox(
            width: 6.0.w,
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text('P25',
                style: TextStyle1(
                  color: Colors.white,
                )),
          )
        ],
      ),
    );
  }

  showAsBottomSheet(
    context: context,
    color: Colors.black,
    // height: 800,
    widget: Container(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 5.0.h,
              ),
              Text(
                'Cart',
                style:
                    TextStyle1(isBold: false, size: 4.0.h, color: Colors.white),
              ),
              SizedBox(
                height: 2.0.h,
              ),
              itemLists(),
              guideLines(),
              SizedBox(
                height: 2.0.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total',
                      style:
                          TextStyle(color: Colors.grey[300], fontSize: 3.0.h)),
                  StreamBuilder(
                      stream: ecommerceBloc.fruitListStream,
                      builder: (context, snapshot) {
                        return Text(
                          '${(total - (total > 99 ? 25 : 0)).round()}',
                          style: TextStyle1(
                              isBold: true, size: 4.0.h, color: Colors.white),
                        );
                      }),
                ],
              ),
              SizedBox(
                height: 2.0.h,
              ),
              ElevatedButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: BorderSide(color: Colors.red)))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Expanded(child: Center(child: Text('Next'))),
                    Icon(Icons.arrow_forward_rounded),
                  ],
                ),
                onPressed: () {},
              ),
            ]),
      ),
    ),
  );
}

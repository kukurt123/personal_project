import 'package:flutter/material.dart';
import 'package:new_practice/mock_data/restaurant_data.dart';
import 'package:new_practice/models/order.dart';
import 'package:stepper_counter_swipe/stepper_counter_swipe.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final cart = currentUser.cart;
    double total = 0;
    // List<double> priceLists = cart.map((x) => x.food.price);
    // final sum = priceLists.reduce((a, b) => a + b);
    cart.forEach((y) => total = (total + y.food.price));
    print('sum ' + total.toString());

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart (' + currentUser.cart.length.toString() + ')'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemCount: currentUser.cart.length + 1,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
              color: Colors.black12,
              height: 2.0,
            );
          },
          itemBuilder: (BuildContext context, int index) {
            if (index < currentUser.cart.length) {
              return Container(
                margin: EdgeInsets.all(10),
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image:
                              AssetImage(currentUser.cart[index].food.imageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        // width: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              currentUser.cart[index].food.name,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              currentUser.cart[index].restaurant.name,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'P' +
                                  currentUser.cart[index].food.price
                                      .round()
                                      .toString(),
                              style:
                                  TextStyle(fontSize: 20, color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.all(0),
                        child: StepperSwipe(
                          initialValue: 0,
                          iconsColor: Colors.black,
                          withFastCount: true,
                          withSpring: true,
                          withBackground: true,
                          stepperValue: currentUser.cart[index].quantity,
                          speedTransitionLimitCount:
                              3, //Trigger count for fast counting
                          onChanged: (int value) => print('new value $value'),
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
                  ],
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Estimated Delivery Time:',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '25 min',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total Cost',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'P${total.round()}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                )
              ]),
            );
          },
        ),
      ),
      bottomSheet: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            boxShadow: [
              BoxShadow(
                  blurRadius: 6.0, color: Colors.black38, offset: Offset(0, -1))
            ]),
        child: Center(
          child: Text('CHECKOUT',
              style: TextStyle(color: Colors.white, fontSize: 20)),
        ),
      ),
    );
  }
}

_buildMenuItem(Order menuItem, BuildContext context) {
  return Center(
    child: Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Container(
          height: 100.0,
          width: 100.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(menuItem.food.imageUrl),
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
      ],
    ),
  );
}

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

class UserHomeCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userHomeBloc = Modular.get<UserHomeBloc>();

    List<Widget> lists(BuildContext context) {
      List<Widget> list = [];
      userHomeBloc.markers.values.asMap().forEach((id, items) {
        final item = items.values.last;
        list.add(GestureDetector(
          onTap: () {
            print('gesture detector....');
            item.infoWindow.onTap();
          },
          child: Container(
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  // fit: StackFit.,
                  children: <Widget>[
                    // Image.asset(item.imageUrl, fit: BoxFit.fitHeight),
                    Positioned(
                      bottom: 0.0,
                      left: 0.0,
                      right: 0.0,
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(230, 255, 255, 255),
                                Color.fromARGB(210, 255, 255, 255),
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 20.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item.markerId.value != null
                                      ? item.infoWindow.title
                                      : "",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.infoWindow.snippet,
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ])),
                    ),
                  ],
                )),
          ),
        ));
      });
      return list.toList();
    }

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 3.6,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: true,
      ),
      items: lists(context),
    );
  }
}

Container modalDialogDetails() {
  return Container(
    height: 40.0.h,
    child: Padding(
      padding: EdgeInsets.all(5.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 1.0.h,
          ),
          Text(
            'Hi there',
            style: TextStyle1(size: 2.0.h),
          ),
          Text(
            'Where to?',
            style: TextStyle1(size: 3.0.h),
          ),
          SizedBox(height: 3.0.h),
          StreamBuilder<Object>(
              stream: null,
              builder: (context, snapshot) {
                return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(color: Colors.black, blurRadius: 1.0.w)
                        ]),
                    height: 6.0.h,
                    child: Padding(
                      padding: EdgeInsets.all(1.0.w),
                      child: Row(
                        children: [
                          Icon(
                            Icons.search,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 1.0.w,
                          ),
                          Text('Search Drop Off',
                              style: TextStyle1(size: 2.0.h)),
                        ],
                      ),
                    ));
              }),
          SizedBox(height: 3.0.h),
          Row(
            children: [
              Icon(
                Icons.home,
                color: Colors.grey,
              ),
              SizedBox(
                width: 1.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Home',
                    style: TextStyle1(size: 2.0.h, isBold: true),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text('Your living home address',
                      style: TextStyle1(size: 1.8.h, color: Colors.grey)),
                ],
              )
            ],
          ),
          Divider(
            height: 2.0.h,
            thickness: 0.3.h,
          ),
          Row(
            children: [
              Icon(
                Icons.home,
                color: Colors.grey,
              ),
              SizedBox(
                width: 1.0.h,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Add Work',
                    style: TextStyle1(size: 2.0.h, isBold: true),
                  ),
                  SizedBox(
                    height: 1.0.h,
                  ),
                  Text('Your office address',
                      style: TextStyle1(size: 1.8.h, color: Colors.grey)),
                ],
              )
            ],
          ),
        ],
      ),
    ),
  );
}

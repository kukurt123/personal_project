import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';

class UserHomeCarousel extends StatelessWidget {
  // final Map<MarkerId, Marker> posts = {};

  // UserHomeCarousel({posts});

  @override
  Widget build(BuildContext context) {
    final userHomeBloc = Modular.get<UserHomeBloc>();
    //     userHomeBloc.markers.forEach((e) {
    //   markers.addAll(e);
    //   // print(markers.values);
    //   print(markers.length);
    // });

    List<Widget> lists(BuildContext context) {
      List<Widget> list = [];
      userHomeBloc.markers.values.asMap().forEach((id, items) {
        final item = items.values.last;
        list.add(Container(
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Stack(
                fit: StackFit.passthrough,
                children: <Widget>[
                  // Image.asset(item.imageUrl, fit: BoxFit.fitHeight),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: GestureDetector(
                      onTap: () {
                        print('gesture detector....');
                        item.infoWindow.onTap();
                      },
                      child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromARGB(200, 0, 0, 0),
                                Color.fromARGB(0, 0, 0, 0)
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
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
                                    color: Colors.white,
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  item.infoWindow.snippet,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ])),
                    ),
                  ),
                ],
              )),
        ));
      });
      return list.toList();
    }

    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        height: 150,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: true,
      ),
      items: lists(context),
    );
  }
}

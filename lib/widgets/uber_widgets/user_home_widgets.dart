import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/models/uber/location_model.dart';
import 'package:new_practice/utils/image/image_with_state.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

class UserHomeCarousel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userHomeBloc = Modular.get<UserHomeBloc>();

    List<Widget> lists(BuildContext context) {
      List<Widget> list = [];
      userHomeBloc.locations.forEach((item) {
        list.add(
          GestureDetector(
            onTap: () {
              userHomeBloc.moveToMarker(LatLng(item.lat, item.long));
              // userHomeBloc.locatePosition();
              userHomeBloc.getPolyline(LatLng(item.lat, item.long));
            },
            child: Container(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                child: Stack(
                  children: <Widget>[
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ImageWithState(
                                height: 50,
                                width: 50,
                                futureUrl:
                                    userHomeBloc.downloadImage(item.imageName),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      item.locName,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      item.info,
                                      overflow: TextOverflow.fade,
                                      softWrap: true,
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10.0,
                                      ),
                                    ),
                                  ]),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
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

Widget modalDialogDetails(LocationModel model) {
  final userHomeBloc = Modular.get<UserHomeBloc>();
  return Container(
    height: 40.0.h,
    child: Padding(
      padding: EdgeInsets.all(10.0.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            model.locName,
            style: TextStyle1(size: 3.0.h),
          ),
          Text(
            model.info,
            style: TextStyle1(size: 2.0.h, color: Colors.grey[700]),
          ),
          Expanded(
            child: ImageWithState(
              futureUrl: userHomeBloc.downloadImage(model.imageName),
              height: 100,
              width: 100,
            ),
          ),
        ],
      ),
    ),
  );
}

class PlacesPageTile extends StatelessWidget {
  const PlacesPageTile({Key key, @required this.location, this.onTap})
      : super(key: key);
  final LocationModel location;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(location.locName),
      onTap: onTap,
    );
  }
}

import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/config/maps/config_maps.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:new_practice/widgets/uber_widgets/floating_search_bar.dart';
import 'package:new_practice/widgets/uber_widgets/user_drawer.dart';
import 'package:new_practice/widgets/uber_widgets/user_home_widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class UserHome extends StatefulWidget {
  final User user;

  UserHome({Key key, this.user}) : super(key: key);

  @override
  _UserHomeState createState() => _UserHomeState();
}

class _UserHomeState extends State<UserHome> {
  @override
  void initState() {
    super.initState();
    print('init state???');
    // userHomeBloc.isDoneLoading.add(false);
  }

  final userHomeBloc = Modular.get<UserHomeBloc>();
  final uberBloc = Modular.get<UberUserBloc>();
  @override
  Widget build(BuildContext context) {
    userHomeBloc.cont = context;
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Map<MarkerId, Marker> markers = {};
    Map<PolylineId, Polyline> polyline = {};

    return Scaffold(
      body: StreamBuilder(
          stream: userHomeBloc.getStreams$(),
          builder: (context, snapshot) {
            if (userHomeBloc.markers.values != null) {
              print('has data....${userHomeBloc.markers.values.length}');
              userHomeBloc.markers.forEach((e) {
                markers.addAll(e);
              });
              userHomeBloc.polylines.forEach((e) {
                polyline.addAll(e);
              });
              return Stack(
                children: [
                  GoogleMap(
                    initialCameraPosition: userHomeBloc.initialLocation,
                    myLocationEnabled: true,
                    // gestureRecognizers: Set()
                    //   ..add(Factory<DragGestureRecognizer>(
                    //       () => GestureEnabledOnMap(() {
                    //             print('test');
                    //           }))),
                    // gestureRecognizers: Set()..add(Factory<DragGestureRecognizer>(() => GestureEnabledOnMap(() {print('test');})),
                    // onCameraIdle:
                    //     userHomeBloc.closeListOfContainers(),
                    myLocationButtonEnabled: false,
                    mapType: MapType.normal,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    scrollGesturesEnabled: true,
                    markers: Set<Marker>.of(markers.values),
                    polylines: Set<Polyline>.of(polyline.values),
                    onMapCreated: (GoogleMapController controller) async {
                      userHomeBloc.mapController = controller;
                      if (!userHomeBloc.controllerGoogleMap.isCompleted) {
                        userHomeBloc.controllerGoogleMap.complete(controller);
                        await userHomeBloc.initialAdd();
                        await userHomeBloc.cameraGoToInitialAddress();
                        userHomeBloc.isDoneLoading.add(true);
                      }
                    },
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: 0,
                    child: SlideInDown(
                      animate: true,
                      child: UserHomeCarousel(),
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    // height: 100,
                    bottom: 0,
                    child: Container(
                      // height: 50,
                      // width: double.infinity,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          RaisedButton(
                            color: Colors.red,
                            child: Text('+',
                                style: TextStyle1(
                                    isBold: true,
                                    color: Colors.white,
                                    size: 30)),
                            onPressed: () async {
                              final newLat = mainLat + Random().nextDouble();
                              final newLong = mainLong + Random().nextDouble();
                              final newLatLng = LatLng(newLat, newLong);
                              userHomeBloc.latestMarker = newLatLng;
                              await userHomeBloc.addMarker(
                                  newLatLng,
                                  newLat.toString(),
                                  BitmapDescriptor.defaultMarker);
                              if (markers.length > 0) {
                                await userHomeBloc.moveToMarker(
                                    userHomeBloc.latestMarker ??
                                        mainCoordinates);
                              }
                            },
                          ),
                          RaisedButton(
                              color: Colors.purple,
                              child: Text('+',
                                  style: TextStyle1(
                                      isBold: true,
                                      color: Colors.white,
                                      size: 30)),
                              onPressed: () {
                                final newLat = mainLat + Random().nextDouble();
                                final newLong =
                                    mainLong + Random().nextDouble();
                                final newLatLng = LatLng(newLat, newLong);
                                userHomeBloc.latestMarker = newLatLng;
                                userHomeBloc.addMarker(
                                    newLatLng,
                                    newLat.toString(),
                                    BitmapDescriptor.defaultMarkerWithHue(
                                        BitmapDescriptor.hueMagenta));
                                if (markers.length > 0) {
                                  userHomeBloc.moveToMarker(
                                      userHomeBloc.latestMarker ??
                                          mainCoordinates);
                                }
                              }),
                          Expanded(
                            child: RaisedButton(
                              color: Colors.grey[700],
                              child: Icon(Icons.linear_scale_outlined),
                              onPressed: () {
                                userHomeBloc
                                    .getPolyline(userHomeBloc.latestMarker);
                              },
                            ),
                          ),
                          RaisedButton(
                              color: Colors.black54,
                              child: Icon(
                                Icons.search,
                                color: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          floatingSearchBar()),
                                );
                                print('on searched pressed');
                              }),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

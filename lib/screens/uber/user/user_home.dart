import 'dart:math';

import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/config/maps/config_maps.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
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
  }

  final userHomeBloc = Modular.get<UserHomeBloc>();
  final uberBloc = Modular.get<UberUserBloc>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    Map<MarkerId, Marker> markers = {};

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              StreamBuilder<Map<MarkerId, Marker>>(
                  stream: userHomeBloc.getMarkers$,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      userHomeBloc.markers.forEach((e) {
                        markers.addAll(e);
                        // print(markers.values);
                        print(markers.length);
                      });
                      return Stack(
                        children: [
                          GoogleMap(
                            initialCameraPosition: userHomeBloc.initialLocation,
                            myLocationEnabled: true,
                            myLocationButtonEnabled: false,
                            mapType: MapType.normal,
                            zoomGesturesEnabled: true,
                            zoomControlsEnabled: true,
                            scrollGesturesEnabled: true,
                            markers: Set<Marker>.of(markers.values),
                            onMapCreated: (GoogleMapController controller) {
                              userHomeBloc.mapController = controller;
                              if (!userHomeBloc
                                  .controllerGoogleMap.isCompleted) {
                                userHomeBloc.controllerGoogleMap
                                    .complete(controller);
                                // userHomeBloc.cameraGoToInitialAddress();
                              }
                              print('move to marker');
                            },
                          ),
                          Positioned(
                            width: MediaQuery.of(context).size.width,
                            top: 0,
                            child: UserHomeCarousel(),
                          ),
                          Positioned(bottom: 50, child: Text('testing'))
                        ],
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  }),

              Positioned(
                width: MediaQuery.of(context).size.width,
                // height: 100,
                bottom: 0,
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RaisedButton(
                        child: Text('+ Markers'),
                        onPressed: () {
                          final newLat = mainLat + Random().nextDouble();
                          final newLong = mainLong + Random().nextDouble();
                          final newLatLng = LatLng(newLat, newLong);
                          userHomeBloc.latestMarker = newLatLng;
                          userHomeBloc.addMarker(newLatLng, newLat.toString(),
                              BitmapDescriptor.defaultMarker);
                          if (markers.length > 0) {
                            userHomeBloc.moveToMarker(
                                userHomeBloc.latestMarker ?? mainCoordinates);
                          }
                        },
                      ),
                      RaisedButton(
                        child: Text('+ Markers'),
                        onPressed: () {
                          final newLat = mainLat + Random().nextDouble();
                          final newLong = mainLong + Random().nextDouble();
                          final newLatLng = LatLng(newLat, newLong);
                          userHomeBloc.latestMarker = newLatLng;
                          userHomeBloc.addMarker(
                              newLatLng,
                              newLat.toString(),
                              BitmapDescriptor.defaultMarkerWithHue(
                                  BitmapDescriptor.hueMagenta));
                          if (markers.length > 0) {
                            userHomeBloc.moveToMarker(
                                userHomeBloc.latestMarker ?? mainCoordinates);
                          }
                        },
                      ),
                      RaisedButton(
                        child: Text('- Marker'),
                        onPressed: () {
                          // setState()
                        },
                      ),
                      Expanded(
                        child: RaisedButton(
                          child: Text('+ Markers'),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
              )
              // TODO: Add Map View
            ],
          ),
        ),
      ),
    );
  }
}

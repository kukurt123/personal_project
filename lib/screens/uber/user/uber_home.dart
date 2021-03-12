import 'dart:async';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/services/uber_clone/assistant_method.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:new_practice/widgets/uber_widgets/user_drawer.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class UberHome extends StatefulWidget {
  final User user;

  UberHome({Key key, this.user}) : super(key: key);

  @override
  _UberHomeState createState() => _UberHomeState();
}

class _UberHomeState extends State<UberHome> {
  Completer<GoogleMapController> _controllerGoogleMap = Completer();
  GoogleMapController newMapController;
  final auth = Modular.get<AuthService>();
  final uberbloc = Modular.get<UberUserBloc>();
  Position currentPosition;
  double bottomPaddingOfMap = 0;
  var geoLocator = Geolocator();
  Map<MarkerId, Marker> markers = {};
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawerEnableOpenDragGesture: false,
        drawer: Drawer(
          child: UserDrawer(),
        ),
        body: Builder(
          builder: (cont) {
            return Stack(
              children: [
                GoogleMap(
                    padding: EdgeInsets.only(bottom: bottomPaddingOfMap),
                    mapType: MapType.normal,
                    myLocationButtonEnabled: true,
                    initialCameraPosition: _kGooglePlex,
                    myLocationEnabled: true,
                    zoomGesturesEnabled: true,
                    zoomControlsEnabled: true,
                    onMapCreated: (GoogleMapController controller) {
                      _controllerGoogleMap.complete(controller);
                      newMapController = controller;
                      locatePosition();

                      setState(() {
                        bottomPaddingOfMap = 300.0;
                      });
                    }),
                Positioned(
                  top: 5.0.h,
                  left: 3.0.w,
                  width: 12.0.w,
                  height: 6.0.h,
                  child: Container(
                    child: IconButton(
                        icon: Icon(Icons.menu),
                        onPressed: () {
                          uberbloc.isLoaded = true;
                          Scaffold.of(cont).openDrawer();
                        }),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                  ),
                ),
                Positioned(
                  left: 0.0,
                  right: 0.0,
                  bottom: 0.0,
                  child: Container(
                    height: 45.0.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18.0),
                          topRight: Radius.circular(18.0)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 16.0,
                          spreadRadius: 0.5,
                          offset: Offset(0.7, 0.7),
                        ),
                      ],
                    ),
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
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black, blurRadius: 1.0.w)
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
                              )),
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
                                    style:
                                        TextStyle1(size: 2.0.h, isBold: true),
                                  ),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Text('Your living home address',
                                      style: TextStyle1(
                                          size: 1.8.h, color: Colors.grey)),
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
                                    style:
                                        TextStyle1(size: 2.0.h, isBold: true),
                                  ),
                                  SizedBox(
                                    height: 1.0.h,
                                  ),
                                  Text('Your office address',
                                      style: TextStyle1(
                                          size: 1.8.h, color: Colors.grey)),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  bottom: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: 3.0.w, vertical: 1.0.h),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.list,
                            ),
                            onPressed: () {
                              print('tester');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.check_box),
                            onPressed: () {
                              print('tester');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.arrow_back),
                            onPressed: () {
                              print('tester');
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.accessibility_new),
                            onPressed: () {
                              print('tester');
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
          },
        ));
  }

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;
    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(
      target: latLatPosition,
      zoom: 14,
    );
    newMapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address = await AssistantMethods.searchCoordinateAddress(position);
    print('location....$address');
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(6.511147, 124.835194),
    zoom: 14.4746,
  );

  Future<void> _signOut() async {
    try {
      await auth.signOut();
    } catch (e) {
      print(e.toString());
    }
  }
}

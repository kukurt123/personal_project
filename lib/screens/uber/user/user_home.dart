import 'dart:io';
import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/models/uber/location_model.dart';
import 'package:new_practice/static/config/maps/config_maps.dart';
import 'package:new_practice/utils/loading/loading_util.dart';
import 'package:new_practice/utils/loading/progress_dialog.dart';
import 'package:new_practice/utils/popup_menu/show_modal_bottom.dart';
import 'package:new_practice/widgets/uber_widgets/user_home_widgets.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:uuid/uuid.dart';

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
    BotToast.showLoading(duration: Duration(seconds: 3));
  }

  final userHomeBloc = Modular.get<UserHomeBloc>();
  final uberBloc = Modular.get<UberUserBloc>();
  final mainBloc = Modular.get<MainBloc>();
  final loadingUtil = Modular.get<LoadingUtil>();
  @override
  Widget build(BuildContext context) {
    userHomeBloc.cont = context;
    return Scaffold(
      body: StreamBuilder(
          stream: userHomeBloc.getStreams$(),
          builder: (context, snapshot) {
            if (userHomeBloc.markers.values != null) {
              userHomeBloc.populateMarkersPolylines();
              return Stack(
                children: [
                  StreamBuilder<bool>(
                      stream: userHomeBloc.isDoneLoading.stream,
                      builder: (context, snapshot) {
                        return _googleMap(
                            userHomeBloc.circleValues,
                            userHomeBloc.markerValues,
                            userHomeBloc.polylineValues);
                      }),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    top: 0,
                    child: SlideInDown(
                      delay: Duration(seconds: 5),
                      animate: true,
                      child: userHomeBloc.locations.isEmpty
                          ? SizedBox(width: 20)
                          : UserHomeCarousel(),
                    ),
                  ),
                  Positioned(
                    width: MediaQuery.of(context).size.width,
                    bottom: 0,
                    child: Container(
                        height: 50,
                        child: Center(
                            child:
                                _listViewButtons(userHomeBloc.markerValues))),
                  )
                ],
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _googleMap(Map<CircleId, Circle> circles,
      Map<MarkerId, Marker> markers, Map<PolylineId, Polyline> polyline) {
    return GoogleMap(
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
      onTap: userHomeBloc.onTapMap,
      myLocationButtonEnabled: false,
      mapType: MapType.normal,
      zoomGesturesEnabled: true,
      // zoomControlsEnabled: true,
      scrollGesturesEnabled: true,
      circles: Set<Circle>.of(circles.values),
      markers: Set<Marker>.of(markers.values),
      polylines: Set<Polyline>.of(polyline.values),
      onMapCreated: (GoogleMapController controller) async {
        showDialog(
            useSafeArea: false,
            context: context,
            child: Center(
                child: Container(
              height: 100,
              alignment: Alignment.center,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: RichText(
                    text: TextSpan(
                        text:
                            'Click your desired location in the map and click the',
                        style: TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: '  +  ',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.bold)),
                          TextSpan(
                              text: 'button below to save the location',
                              style: TextStyle(color: Colors.black))
                        ]),
                  ),
                ),
              ),
            )));
        userHomeBloc.mapController = controller;
        if (!userHomeBloc.controllerGoogleMap.isCompleted) {
          userHomeBloc.controllerGoogleMap.complete(controller);
          await userHomeBloc.getLocations();
          await userHomeBloc.initialAdd();
          await userHomeBloc.cameraGoToInitialAddress();
          userHomeBloc.isDoneLoading.add(true);
        }
      },
    );
  }

  Widget _listViewButtons(Map<MarkerId, Marker> markers) {
    return ListView(
      addAutomaticKeepAlives: true,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      children: <Widget>[
        // RaisedButton(
        //   color: Colors.red,
        //   child: Icon(
        //     Icons.add_location,
        //     color: Colors.white,
        //   ),
        //   onPressed: () async {
        //     final newLat = mainLat + Random().nextDouble();
        //     final newLong = mainLong + Random().nextDouble();
        //     final newLatLng = LatLng(newLat, newLong);
        //     userHomeBloc.latestMarker = newLatLng;

        //     await userHomeBloc.addMarker(newLatLng, newLat.toString(), "1");
        //     if (markers.length > 0) {
        //       await userHomeBloc
        //           .moveToMarker(userHomeBloc.latestMarker ?? mainCoordinates);
        //     }
        //   },
        // ),
        // RaisedButton(
        //     color: Colors.purple,
        //     child: Icon(
        //       Icons.add_location,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       final newLat = mainLat + Random().nextDouble();
        //       final newLong = mainLong + Random().nextDouble();
        //       final newLatLng = LatLng(newLat, newLong);
        //       userHomeBloc.latestMarker = newLatLng;
        //       userHomeBloc.addMarker(
        //         newLatLng,
        //         newLat.toString(),
        //         "1",
        //       );
        //       if (markers.length > 0) {
        //         userHomeBloc
        //             .moveToMarker(userHomeBloc.latestMarker ?? mainCoordinates);
        //       }
        //     }),
        RaisedButton(
            color: Colors.black54,
            child: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {
              Modular.link.pushNamed('/search');
              print('on searched pressed');
            }),
        // RaisedButton(
        //     color: Colors.black54,
        //     child: Icon(
        //       Icons.create_rounded,
        //       color: Colors.white,
        //     ),
        //     onPressed: () {
        //       print('on searched pressed');
        //     }),
        RaisedButton(
            color: Colors.black54,
            child: Icon(
              Icons.add_circle,
              color: Colors.green,
            ),
            onPressed: () {
              _showButtonSheet();
            }),
      ],
    );
  }

  _showButtonSheet() {
    final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
    final requestController = TextEditingController();
    final paymentController = TextEditingController();
    final nameController = TextEditingController();
    showAsBottomSheet(
      context: context,
      // height: 800,
      widget: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FormBuilder(
                key: keyy,
                onChanged: () {},
                child: Column(
                  children: [
                    Text('Save Location',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold)),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    FormBuilderTextField(
                      controller: nameController,
                      name: 'name',
                      decoration: InputDecoration(
                          labelText: 'Place', icon: Icon(Icons.place)),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    FormBuilderTextField(
                      controller: requestController,
                      name: 'request',
                      decoration: InputDecoration(
                          labelText: 'Additional Info.',
                          icon: Icon(Icons.info)),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    //   FormBuilderTextField(
                    //     controller: paymentController,
                    //     name: 'payment',
                    //     decoration: InputDecoration(
                    //         labelText: 'Payment', icon: Icon(Icons.money)),
                    //   ),
                  ],
                ),
              ),
              Text('Select Image:', style: TextStyle(color: Colors.grey)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () async {
                      await userHomeBloc.pickImage(isCamera: false);
                    },
                    splashRadius: 30,
                    iconSize: 40,
                    padding: EdgeInsets.all(30),
                    icon: Icon(
                      Icons.image_outlined,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                  // SizedBox(
                  //   width: 40,
                  // ),
                  IconButton(
                    onPressed: () async {
                      await userHomeBloc.pickImage(isCamera: true);
                    },
                    splashRadius: 30,
                    iconSize: 40,
                    padding: EdgeInsets.all(30),
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      textDirection: TextDirection.rtl,
                    ),
                  ),
                ],
              ),
              Center(
                child: StreamBuilder<File>(
                    stream: userHomeBloc.file$,
                    builder: (context, snapshot) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 10.0),
                        width: 65,
                        height: 65,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: Offset(0, 2),
                              blurRadius: 6.0,
                            ),
                          ],
                          border: Border.all(
                              width: 2, color: Theme.of(context).primaryColor),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: snapshot.hasData
                                ? FileImage(snapshot.data)
                                : AssetImage('assets/images/login_image.jpg'),
                          ),
                        ),
                      );
                    }),
              ),
              // Image(image: Image.file('')),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Material(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),
                      splashColor: Colors.blue[900],
                      // highlightColor: Colors.amber,

                      onTap: () async {
                        if (userHomeBloc.file.value == null ||
                            nameController.text.isEmpty ||
                            requestController.text.isEmpty) {
                          BotToast.showText(
                            text: 'Please fill up all fields',
                          );
                          return;
                        }
                        String id = Uuid().v4();
                        final loc = new LocationModel(
                            id: id,
                            lat: userHomeBloc.mainLatLng.latitude,
                            long: userHomeBloc.mainLatLng.longitude,
                            imageName: id,
                            locName: nameController.text,
                            locDate: new DateTime.now(),
                            type: 1,
                            info: requestController.text);
                        await userHomeBloc.sendData(
                            loc: loc,
                            folderName: 'uberLocations',
                            file: userHomeBloc.file.value,
                            imageName: id);
                        BotToast.showText(
                          text: 'Location Saved!',
                        );
                        userHomeBloc.file.add(null);
                        Navigator.pop(context);
                      },
                      child: Container(
                        // color: Theme.of(context).primaryColor,
                        height: 50,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    elevation: 10,
                    color: Colors.purple),
              ),
            ]),
      ),
    );
  }
}

Container addContainer(BuildContext context) {
  return Container(height: 2000, child: Text('test'));
}

import 'dart:async';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_practice/config/maps/config_maps.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/services/uber_clone/assistant_method.dart';
import 'package:rxdart/rxdart.dart';

class UserHomeBloc {
  bool isLoaded = false;
  final requestQr = new BehaviorSubject<RequestQr>();
  String id = '';
  bool done = false;
  LatLng latestMarker;

  Completer<GoogleMapController> controllerGoogleMap = Completer();
  GoogleMapController mapController;
  Position currentPosition;
  final markers = ReplaySubject<Map<MarkerId, Marker>>();

  get getMarkers$ => markers.stream;

  final CameraPosition initialLocation = CameraPosition(
    target: mainCoordinates,
    zoom: 18.4746,
  );

  // Completer<GoogleMapController> controllerGoogleMap = Completer();
  // GoogleMapController newMapController;
  // final auth = Modular.get<AuthService>();
  // Position currentPosition;
  // double bottomPaddingOfMap = 0;
  // var geoLocator = Geolocator();

  void locatePosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    currentPosition = position;

    LatLng latLatPosition = LatLng(position.latitude, position.longitude);

    CameraPosition cameraPosition = new CameraPosition(
      target: latLatPosition,
      zoom: 14,
    );
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address = await AssistantMethods.searchCoordinateAddress(position);
    print('location....$address');
  }

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
      infoWindow: InfoWindow(
          title: id,
          snippet: 'you clicked me!',
          onTap: () {
            print('you clicked me!!!');
          }),
      markerId: markerId,
      icon: descriptor,
      position: position,
    );
    markers.add({markerId: marker});
  }

  moveToMarker() async {
    print('latestmarker');
    print(latestMarker);
    // CameraPosition cameraPosition = new CameraPosition(
    //   target: latestMarker ?? mainCoordinates,
    //   zoom: 17,
    // );
    // await mapController
    // .moveCamera(CameraUpdate.newCameraPosition(cameraPosition));
    CameraPosition cameraPosition = new CameraPosition(
      target: latestMarker ?? mainCoordinates,
      zoom: 10,
    );
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  cameraGoToInitialAddress() async {
    CameraPosition cameraPosition = new CameraPosition(
      target: mainCoordinates,
      zoom: 10,
    );
    await mapController
        .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
  }

  // Future<void> _signOut() async {
  //   try {
  //     await auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}

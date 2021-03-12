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

  final CameraPosition initialLocation = CameraPosition(
    target: mainCoordinates,
    zoom: 18.4746,
  );

  Completer<GoogleMapController> controllerGoogleMap = Completer();
  GoogleMapController mapController;
  Position currentPosition;
  Map<MarkerId, Marker> markers = {};

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
    Marker marker =
        Marker(markerId: markerId, icon: descriptor, position: position);
    markers[markerId] = marker;
  }

  // Future<void> _signOut() async {
  //   try {
  //     await auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}

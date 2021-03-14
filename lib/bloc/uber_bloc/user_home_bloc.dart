import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:new_practice/config/maps/config_maps.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/services/uber_clone/assistant_method.dart';
import 'package:new_practice/widgets/uber_widgets/user_home_widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:rxdart/rxdart.dart';

class UserHomeBloc {
  UserHomeBloc() {
    print('userHomebloc');
    getPolylines$.listen((x) => print('polylines....'));
    getMarkers$.listen((x) => print('markers....'));
    getStreams$().listen((x) => print('getStream....'));
  }
  BuildContext cont;
  bool isLoaded = false;
  final requestQr = new BehaviorSubject<RequestQr>();
  String id = '';
  bool done = false;
  LatLng latestMarker;
  PolylinePoints polylinePoints = PolylinePoints();
  // Map<PolylineId, Polyline> polylines = {};
  Completer<GoogleMapController> controllerGoogleMap = Completer();
  GoogleMapController mapController;
  Position currentPosition;
  final markers = ReplaySubject<Map<MarkerId, Marker>>();
  final polylines = ReplaySubject<Map<PolylineId, Polyline>>();
  final isOpenedContainer = new BehaviorSubject<bool>.seeded(false);
  final isOpenBoxInfo = new BehaviorSubject<bool>.seeded(false);
  final isDoneLoading = BehaviorSubject<bool>();
  get getMarkers$ => markers.stream;
  get getPolylines$ => polylines.stream;

  final CameraPosition initialLocation = CameraPosition(
    target: mainCoordinates,
    zoom: 18.4746,
  );

  Stream getStreams$() {
    return MergeStream([markers, polylines, isDoneLoading]);
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
    mapController.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));

    String address = await AssistantMethods.searchCoordinateAddress(position);
    print('location....$address');
  }

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) {
    MarkerId markerId = MarkerId(id);
    Marker marker = Marker(
        infoWindow:
            InfoWindow(title: id, snippet: 'you clicked me!', onTap: () {}),
        markerId: markerId,
        icon: descriptor,
        position: position,
        draggable: true,
        onTap: () {
          moveToMarker(position);
          getPolyline(position);
          showBottomSheetModal(context: cont, widget: modalDialogDetails());
        });
    markers.sink.add({markerId: marker});
  }

  markerBehavior(LatLng position) {
    moveToMarker(position);
    getPolyline(position);
    showBottomSheetModal(context: cont, widget: modalDialogDetails());
  }

  openListOfContainers() {
    print('opennn....');
    if (isOpenedContainer.value) {
      isOpenedContainer.sink.add(false);
    }
  }

  closeListOfContainers() {
    print('closeeeee....');
    if (!isOpenedContainer.value) {
      isOpenedContainer.sink.add(true);
    }
  }

  moveToMarker(LatLng coordinates) async {
    print('latestmarker');
    print(latestMarker);
    CameraPosition cameraPosition = new CameraPosition(
      target: coordinates,
      zoom: 10,
    );
    if (markers.values != null) {
      await mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  initialAdd() async {
    final newLatLng = LatLng(mainLat, mainLong);
    latestMarker = newLatLng;
    await addMarker(
        newLatLng, mainLat.toString(), BitmapDescriptor.defaultMarker);
    await moveToMarker(latestMarker ?? mainCoordinates);
    print('initial add....');
  }

  cameraGoToInitialAddress() async {
    if (markers.isEmpty != null) {
      CameraPosition cameraPosition = new CameraPosition(
        target: mainCoordinates,
        zoom: 10,
      );
      await mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    }
  }

  void getPolyline(LatLng position) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapKey,
      PointLatLng(mainLat, mainLong),
      PointLatLng(position.latitude, position.longitude),
      travelMode: TravelMode.driving,
      // optimizeWaypoints: true
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    } else {
      print(result.errorMessage);
    }
    _addPolyLine(polylineCoordinates);
  }

  _addPolyLine(List<LatLng> polylineCoordinates) {
    PolylineId id = PolylineId("poly");
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.grey[700],
      points: polylineCoordinates,
      width: 8,
    );
    polylines.sink.add({id: polyline});
  }

  showBottomSheetModal({BuildContext context, Widget widget}) {
    showModalBottomSheet<void>(
      context: context,
      barrierColor: Colors.transparent,
      elevation: 20,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      builder: (BuildContext context) {
        return widget;
      },
    );
  }
  // Future<void> _signOut() async {
  //   try {
  //     await auth.signOut();
  //   } catch (e) {
  //     print(e.toString());
  //   }
  // }
}

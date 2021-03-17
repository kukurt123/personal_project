import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/models/uber/location_model.dart';
import 'package:new_practice/services/login_services/firebase/firestore_uber.dart';
import 'package:new_practice/services/uber_clone/assistant_method.dart';
import 'package:new_practice/static/config/maps/config_maps.dart';
import 'package:new_practice/utils/popup_menu/show_modal_bottom.dart';
import 'package:new_practice/widgets/uber_widgets/user_home_widgets.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class UserHomeBloc {
  UserHomeBloc() {
    getPolylines$.listen((x) => print('polylines....'));
    getMarkers$.listen((x) => print('markers....'));
    getStreams$().listen((x) => print('getStream....'));
  }

  final firestoreUber = Modular.get<FirestoreUber>();

  final markers = ReplaySubject<Map<MarkerId, Marker>>();
  final polylines = ReplaySubject<Map<PolylineId, Polyline>>();
  final isOpenedContainer = new BehaviorSubject<bool>.seeded(false);
  final isOpenBoxInfo = new BehaviorSubject<bool>.seeded(false);
  final isDoneLoading = BehaviorSubject<bool>();
  final file = BehaviorSubject<File>();
  final requestQr = new BehaviorSubject<RequestQr>();

  BuildContext cont;
  bool isLoaded = false;
  String id = '';
  bool done = false;
  LatLng latestMarker;
  PolylinePoints polylinePoints = PolylinePoints();
  Completer<GoogleMapController> controllerGoogleMap = Completer();
  GoogleMapController mapController;
  Position currentPosition;
  final picker = ImagePicker();
  Map<MarkerId, Marker> markerValues = {};
  Map<PolylineId, Polyline> polylineValues = {};
  List<LocationModel> locations = [];

  get getMarkers$ => markers.stream;
  get getPolylines$ => polylines.stream;
  get file$ => file.stream;

  final CameraPosition initialLocation = CameraPosition(
    target: mainCoordinates,
    zoom: 18.4746,
  );

  Stream getStreams$() {
    return MergeStream(
        [markers, polylines, isDoneLoading, firestoreUber.locationsStream()]);
  }

  getLocations() {
    firestoreUber.locationsStream().listen((i) async {
      // LocationModel item =
      i.forEach((item) {
        // print(item.toString());
        addMarkerFromStream(item);
        locations.add(item);
      });
    });
  }

  Future<String> downloadImage(String imagePath) async {
    final link = await firebase_storage.FirebaseStorage.instance
        .ref('uberLocations/$imagePath.jpg')
        .getDownloadURL();
    print('downloadImage$link');
    return link;
  }

  void populateMarkersPolylines() {
    markers.forEach((e) {
      markerValues.addAll(e);
    });
    polylines.forEach((e) {
      polylineValues.addAll(e);
    });
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

  addMarker(LatLng position, String id, BitmapDescriptor descriptor) async {
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
          final result = locations.where((x) => x.id == id).first;
          showBottomSheetModal(
              context: cont, widget: modalDialogDetails(result));
        });
    markers.sink.add({markerId: marker});
  }

  addMarkerFromStream(LocationModel loc) async {
    MarkerId markerId = MarkerId(loc.id);
    final position = LatLng(loc.lat, loc.long);
    Marker marker = Marker(
        infoWindow: InfoWindow(title: id, snippet: loc.info, onTap: () {}),
        markerId: markerId,
        icon: loc.type == 2
            ? BitmapDescriptor.defaultMarker
            : BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
        position: position,
        draggable: true,
        onTap: () {
          moveToMarker(position);
          getPolyline(position);
          showBottomSheetModal(context: cont, widget: modalDialogDetails(loc));
        });
    markers.sink.add({markerId: marker});
  }

  // markerBehavior(LatLng position) {
  //   moveToMarker(position);
  //   getPolyline(position);

  //   showBottomSheetModal(context: cont, widget: modalDialogDetails());
  // }

  openListOfContainers() {
    //print('open...');
    if (isOpenedContainer.value) {
      isOpenedContainer.sink.add(false);
    }
  }

  closeListOfContainers() {
    //print('...close......test...');
    if (!isOpenedContainer.value) {
      isOpenedContainer.sink.add(true);
    }
  }

  moveToMarker(LatLng coordinates) async {
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

  getPolyline(LatLng position) async {
    List<LatLng> polylineCoordinates = [];

    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapKey,
      PointLatLng(mainLat, mainLong),
      PointLatLng(position.latitude, position.longitude),
      travelMode: TravelMode.driving,
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

  pickImage({bool isCamera}) async {
    final pickedFile = await picker.getImage(
        source: isCamera ? ImageSource.camera : ImageSource.gallery);
    print('resultttttttttt $pickedFile');
    if (pickedFile != null) {
      final File file2 = File(pickedFile.path);
      print('' + file2.path);
      file.add(file2);
    }
  }

  Future<firebase_storage.UploadTask> sendData(
      {LocationModel loc,
      String folderName,
      String imageName,
      File file}) async {
    if (file == null) {
      await Fluttertoast.showToast(
          msg: "File not found",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }

    firebase_storage.UploadTask uploadTask;

    // Create a Reference to the file
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance
        .ref()
        .child(folderName)
        .child('/$imageName.jpg');

    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': file.path});

    try {
      if (kIsWeb) {
        uploadTask = ref.putData(await file.readAsBytes(), metadata);
      } else {
        uploadTask = ref.putFile(file, metadata);
      }
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return null;
    }

    await firestoreUber.setLocation(loc);
    Fluttertoast.showToast(
        msg: "Sending Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
        fontSize: 16.0);
    print(loc.toString());
    return Future.value(uploadTask);
  }
}

// Future<void> _signOut() async {
//   try {
//     await auth.signOut();
//   } catch (e) {
//     print(e.toString());
//   }
// }

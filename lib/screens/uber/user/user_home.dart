import 'package:new_practice/bloc/uber_bloc/uber-user_bloc.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:new_practice/widgets/uber_widgets/user_drawer.dart';
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

    return Scaffold(
      body: Container(
        height: height,
        width: width,
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              GoogleMap(
                initialCameraPosition: userHomeBloc.initialLocation,
                myLocationEnabled: true,
                myLocationButtonEnabled: false,
                mapType: MapType.normal,
                zoomGesturesEnabled: true,
                zoomControlsEnabled: true,
                scrollGesturesEnabled: true,
                markers: Set<Marker>.of(userHomeBloc.markers.values),
                // tiltGesturesEnabled: ,
                onMapCreated: (GoogleMapController controller) {
                  userHomeBloc.locatePosition();
                  if (!userHomeBloc.controllerGoogleMap.isCompleted) {
                    userHomeBloc.controllerGoogleMap.complete(controller);
                    userHomeBloc.mapController = controller;
                  }
                },
              ),
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
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text('+ Markers'),
                        onPressed: () {},
                      ),
                      RaisedButton(
                        child: Text('+ Markers'),
                        onPressed: () {},
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

// static const LatLng _center = const LatLng(33.738045, 73.084488);
// final Set<Marker> _markers = {};
// final Set<Polyline>_polyline={};

// //add your lat and lng where you wants to draw polyline
// LatLng _lastMapPosition = _center;
// List<LatLng> latlng = List();
// LatLng _new = LatLng(33.738045, 73.084488);♂
// LatLng _news = LatLng(33.567997728, 72.635997456);

// latlng.add(_new);
// latlng.add(_news);

// //call this method on button click that will draw a polyline and markers

// void _onAddMarkerButtonPressed() {
//     getDistanceTime();
//     setState(() {
//         _markers.add(Marker(
//             // This marker id can be anything that uniquely identifies each marker.
//             markerId: MarkerId(_lastMapPosition.toString()),
//             //_lastMapPosition is any coordinate which should be your default
//             //position when map opens up
//             position: _lastMapPosition,
//             infoWindow: InfoWindow(
//                 title: 'Really cool place',
//                 snippet: '5 Star Rating',
//             ),
//             icon: BitmapDescriptor.defaultMarker,

//         ));
//         _polyline.add(Polyline(
//             polylineId: PolylineId(_lastMapPosition.toString()),
//             visible: true,
//             //latlng is List<LatLng>
//             points: latlng,
//             color: Colors.blue,
//         ));
//     });

//     //in your build widget method
//     GoogleMap(
//     //that needs a list<Polyline>
//         polylines:_polyline,
//         markers: _markers,
//         onMapCreated: _onMapCreated,
//         myLocationEnabled:true,
//         onCameraMove: _onCameraMove,
//         initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 11.0,
//         ),

//         mapType: MapType.normal,

//     );
// }

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:new_practice/bloc/uber_bloc/user_home_bloc.dart';
import 'package:new_practice/models/uber/location_model.dart';
import 'package:new_practice/utils/list/item-list.widget.dart';

class ChatSearch extends StatelessWidget {
  const ChatSearch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: buildFloatingSearchBar(context),
      ),
    );
  }
}

Widget buildFloatingSearchBar(BuildContext context) {
  final userHomeBloc = Modular.get<UserHomeBloc>();
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  final random = Random().nextDouble();

  return FloatingSearchBar(
    hint: 'Search...',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    maxWidth: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),

    onQueryChanged: (query) {
      userHomeBloc.findPlace(query);
      // Call your model, bloc, controller here.
    },
    body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: userHomeBloc.places.stream,
        builder: (context, snapshot) {
          return ListItemsBuilder<dynamic>(
            snapshot: snapshot,
            itemBuilder: (context, item) => ListTile(
              leading: Icon(Icons.place),
              title: Text(item["desc"]),
              onTap: () async {
                Navigator.of(context).pop();
                LocationModel location =
                    await userHomeBloc.getPlaceAddressDetails(item["id"]);
                final latLng = LatLng(location.lat, location.long);
                await userHomeBloc.addMarker(
                    latLng, location.id, location.type.toString());
                await userHomeBloc.getPolyline(latLng);
                await userHomeBloc.moveToMarker(latLng);
                // await showBottomSheetModal(
                //     context: userHomeBloc.cont,
                //     widget: modalDialogDetails(location));
              },
            ),
          );
        }),
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.place),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return Center(child: Text(random.toString()));
      // );
    },
  );
}

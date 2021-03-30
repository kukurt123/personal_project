import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/models/uber/location_model.dart';
import 'package:new_practice/services/login_services/api-path.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'firestore.service.dart';

String docIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreUber {
  final uid = Modular.get<AuthService>().getCurrentUserId();
  // final uid = auth.getCurrentUserId();
  final _service = FirestoreService.instance;

  Future<void> setLocation(
    LocationModel req,
  ) async =>
      await _service.setData(
        path: LocationFirebaseApi.request(uid, req.id),
        data: req.toJson(),
      );

  Stream<List<LocationModel>> locationsStream() => _service.collectionStream(
        path: LocationFirebaseApi.requests(uid),
        builder: (data, documentId) {
          LocationModel req = LocationModel.fromJson(data);
          req.copyWith.call(id: documentId);
          print('copy with' + req.toString());
          return req;
        },
      );

  Stream<LocationModel> locationStream({
    @required String locationId,
  }) =>
      _service.documentStream(
        path: LocationFirebaseApi.request(uid, locationId),
        builder: (data, docId) {
          LocationModel req = LocationModel.fromJson(data);
          req.copyWith.call(id: docId);
          print('copy with' + req.toString());
          return req;
        },
      );
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_practice/models/uber_model/users.dart';
import 'package:new_practice/services/login_services/api-path.dart';

import 'firestore.service.dart';

String docIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirebaseUsers {
  // FirebaseUsers._();
  // static final instance = FirebaseUsers._();
  // final uid = Modular.get<AuthService>().getCurrentUserId();
  // final uid = auth.getCurrentUserId();
  final _service = FirestoreService.instance;

  Future<void> setUser(Users req) async => await _service.setData(
        path: UserFirebaseApi.user(req.uid),
        data: req.toJson(),
      );

  Stream<List<Users>> usersStream() => _service.collectionStream(
        path: UserFirebaseApi.users,
        builder: (data, documentId) {
          Users users = Users.fromJson(data);
          return users;
        },
      );
}

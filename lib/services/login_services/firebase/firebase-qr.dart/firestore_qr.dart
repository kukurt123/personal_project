import 'package:flutter/foundation.dart';
import 'package:new_practice/models/qr/requestqr.dart';

import '../../api-path.dart';
import '../firestore.service.dart';

String docIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreQr {
  FirestoreQr({@required this.uid}) : assert(uid != null);
  final String uid;
  final _service = FirestoreService.instance;

  Future<void> setJob(RequestQr req) async => await _service.setData(
        path: RequestFirebaseApi.request(uid, req.id),
        data: req.toJson(),
      );

  // Future<void> deleteJob(Job job) async {
  //   final allEntries = await entriesStream(job: job).first;
  //   for (Entry entry in allEntries) {
  //     if (entry.jobId == job.id) {
  //       await deleteEntry(entry);
  //     }
  //   }
  //   await _service.deleteData(path: APIPath.job(uid, job.id));
  // }

  Stream<List<RequestQr>> requestsStream() => _service.collectionStream(
        path: RequestFirebaseApi.requests(uid),
        builder: (data, documentId) {
          print('requestStream...${data.length}');
          RequestQr req = RequestQr.fromJson(data);
          req.copyWith.call(id: documentId);
          return req;
        },
      );

  Stream<RequestQr> requestStream({@required String requestId}) =>
      _service.documentStream(
        path: RequestFirebaseApi.request(uid, requestId),
        builder: (data, docId) {
          RequestQr req = RequestQr.fromJson(data);
          req.copyWith.call(id: docId);
          print('copy with' + req.toString());
          return req;
        },
      );

  // Future<void> setEntry(Entry entry) async => await _service.setData(
  //       path: APIPath.entry(uid, entry.id),
  //       data: entry.toMap(),
  //     );

  // Future<void> deleteEntry(Entry entry) async =>
  //     await _service.deleteData(path: APIPath.entry(uid, entry.id));

  // Stream<List<Entry>> entriesStream({Job job}) =>
  //     _service.collectionStream<Entry>(
  //       path: APIPath.entries(uid),
  //       queryBuilder: job != null
  //           ? (query) => query.where('jobId', isEqualTo: job.id)
  //           : null,
  //       builder: (data, documentID) => Entry.fromMap(data, documentID),
  //       sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
  //     );
}

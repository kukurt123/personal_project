import 'package:flutter/foundation.dart';
import 'package:new_practice/models/qr/requestqr.dart';

import '../../api-path.dart';
import '../firestore.service.dart';
// import 'package:torrent/models/entry.dart';
// import 'package:torrent/models/job.dart';
// import 'package:torrent/services/api-path.dart';
// import 'package:torrent/services/firebase/firestore.service.dart';

// abstract class FirebaseDb {
//   Future<void> setJob(Job job);

//   Future<void> deleteJob(Job job);

//   Stream<List<Job>> jobsStream();

//   Future<void> setEntry(Entry entry);

//   Future<void> deleteEntry(Entry entry);

//   Stream<List<Entry>> entriesStream({Job job});

//   Stream<Job> jobStream({@required String jobId});
// }

String docIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirestoreQr {
  FirestoreQr({@required this.uid}) : assert(uid != null);
  final String uid;
  final _service = FirestoreService.instance;

  Future<void> setJob(RequestQr req) async => await _service.setData(
        path: APIPath.request(uid, req.id),
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
        path: APIPath.requests(uid),
        builder: (data, documentId) {
          RequestQr req = RequestQr.fromJson(data);
          req.copyWith.call(id: documentId);
          print('copy with' + req.toString());
          return req;
        },
      );

  Stream<RequestQr> requestStream({@required String requestId}) =>
      _service.documentStream(
        path: APIPath.request(uid, requestId),
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

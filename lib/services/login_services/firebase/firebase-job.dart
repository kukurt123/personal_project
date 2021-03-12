// import 'package:flutter/foundation.dart';
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

// String docIdFromCurrentDate() => DateTime.now().toIso8601String();

// class FirestoreDb implements FirebaseDb {
//   FirestoreDb({@required this.uid}) : assert(uid != null);
//   final String uid;
//   final _service = FirestoreService.instance;

//   @override
//   Future<void> setJob(Job job) async => await _service.setData(
//         path: APIPath.job(uid, job.id),
//         data: job.toMap(),
//       );

//   @override
//   Future<void> deleteJob(Job job) async {
//     final allEntries = await entriesStream(job: job).first;
//     for (Entry entry in allEntries) {
//       if (entry.jobId == job.id) {
//         await deleteEntry(entry);
//       }
//     }
//     await _service.deleteData(path: APIPath.job(uid, job.id));
//   }

//   @override
//   Stream<List<Job>> jobsStream() => _service.collectionStream(
//         path: APIPath.jobs(uid),
//         builder: (data, documentId) => Job.fromMap(data, documentId),
//       );

//   @override
//   Stream<Job> jobStream({@required String jobId}) => _service.documentStream(
//       path: APIPath.job(uid,jobId),
//       builder: (data, docId) => Job.fromMap(data, docId));

//   @override
//   Future<void> setEntry(Entry entry) async => await _service.setData(
//         path: APIPath.entry(uid, entry.id),
//         data: entry.toMap(),
//       );

//   @override
//   Future<void> deleteEntry(Entry entry) async =>
//       await _service.deleteData(path: APIPath.entry(uid, entry.id));

//   @override
//   Stream<List<Entry>> entriesStream({Job job}) =>
//       _service.collectionStream<Entry>(
//         path: APIPath.entries(uid),
//         queryBuilder: job != null
//             ? (query) => query.where('jobId', isEqualTo: job.id)
//             : null,
//         builder: (data, documentID) => Entry.fromMap(data, documentID),
//         sort: (lhs, rhs) => rhs.start.compareTo(lhs.start),
//       );
// }

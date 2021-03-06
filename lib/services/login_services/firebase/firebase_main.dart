import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/services/login_services/api-path.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:dash_chat/dash_chat.dart';
import 'firestore.service.dart';

String docIdFromCurrentDate() => DateTime.now().toIso8601String();

class FirebaseMain {
  FirebaseMain._();
  static final instance = FirebaseMain._();

  // final auth = Modular.get<AuthService>();
  // final uid = Modular.get<AuthService>().getCurrentUserId();
  final _service = FirestoreService.instance;

  // Future<void> setMessage(ChatMessage message, String ids) async =>
  //     await _service.setData(
  //       path: ChatFirebaseApi.chat(ids, message.id),
  //       data: message.toJson(),
  //     );

  // Stream<List<ChatMessage>> chatsStream(String ids) =>
  //     _service.collectionStream(
  //       // queryBuilder: (x) => x.where((ChatMessage z) => z.id.contains(ids)),
  //       path: ChatFirebaseApi.chats(ids),
  //       builder: (data, documentId) {
  //         ChatMessage req = ChatMessage.fromJson(data);
  //         req.id = documentId;
  //         return req;
  //       },
  //     );

  Future<firebase_storage.UploadTask> uploadImage<T>(
      {String folderName, String imageName, File file, String url}) async {
    if (file == null) {
      // await Fluttertoast.showToast(
      //     msg: "File not found",
      //     toastLength: Toast.LENGTH_SHORT,
      //     gravity: ToastGravity.BOTTOM,
      //     backgroundColor: Colors.green,
      //     textColor: Colors.white,
      //     fontSize: 16.0);
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
        if (url.isEmpty) {
          uploadTask = ref.putFile(file, metadata);
        } else {
          // uploadTask = ref.putString(url, metadata);
        }
      }
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return null;
    }
    return Future.value(uploadTask);
  }

  Future<String> downloadImage(String imagePath, String folderName) async {
    final link = await firebase_storage.FirebaseStorage.instance
        .ref('$folderName/$imagePath.jpg')
        .getDownloadURL();
    return link;
  }
}

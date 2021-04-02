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

class FirebaseChat {
  final auth = Modular.get<AuthService>();
  // final uid = Modular.get<AuthService>().getCurrentUserId();
  final _service = FirestoreService.instance;

  Future<ChatUser> userInfo() async {
    final user = auth.currentUser();
    await user.then((x) {
      return ChatUser(
        name: "Fayeed",
        firstName: x.displayName,
        lastName: "",
        uid: x.uid,
        avatar: x.photoUrl,
      );
    });
    return null;
  }

  //   final ChatUser otherUser = ChatUser(
  //   name: "Mrfatty",
  //   uid: "25649654",
  // );

  Future<void> setMessage(ChatMessage message, String uid) async =>
      await _service.setData(
        path: ChatFirebaseApi.chat(uid, message.id),
        data: message.toJson(),
      );

  Stream<List<ChatMessage>> chatsStream(String id) => _service.collectionStream(
        queryBuilder: (x) => x.orderBy('createdAt', descending: false),
        path: ChatFirebaseApi.chats(id),
        builder: (data, documentId) {
          ChatMessage req = ChatMessage.fromJson(data);
          return req;
        },
      );

  // Stream<ChatMessage> chatStream({
  //   @required String locationId,
  // }) =>
  //     _service.documentStream(
  //       path: ChatFirebaseApi.request(uid, locationId),
  //       builder: (data, docId) {
  //         ChatMessage req = ChatMessage.fromJson(data);
  //         req.id = docId;
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
        if (url == null) {
          uploadTask = ref.putFile(file, metadata);
        } else {
          // uploadTask = ref.putString(url, metadata);
        }
      }
    } on firebase_core.FirebaseException catch (e) {
      print(e);
      return null;
    }

    // await firestoreUber.setLocation(loc);
    // Fluttertoast.showToast(
    //     msg: "Sending Successful",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.BOTTOM,
    //     backgroundColor: Colors.green,
    //     textColor: Colors.white,
    //     fontSize: 16.0);
    return Future.value(uploadTask);
  }

  Future<String> downloadImage(
    String folderName,
    String imagePath,
  ) async {
    final link = await firebase_storage.FirebaseStorage.instance
        .ref('$folderName/$imagePath.jpg')
        .getDownloadURL();
    return link;
  }
}

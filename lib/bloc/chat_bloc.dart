import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/models/ecommerce/fruit_total.dart';
import 'package:new_practice/services/login_services/firebase/firebase_chat.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dash_chat/dash_chat.dart';

class ChatBloc {
  bool isLoaded = false;
  final cart = List<Fruit>();
  final cartGrouped = List<FruitTotal>();
  final fruitListStream = BehaviorSubject<bool>.seeded(false);
  String id = '';
  bool done = false;
  String heroTag = '';
  final picker = ImagePicker();
  ChatUser myInfo;
  ChatUser chatMateInfo;
  List<ChatMessage> messages = List<ChatMessage>();

  final chatFirebase = Modular.get<FirebaseChat>();

  Future<void> sendImage() async {
    final result = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 80,
      maxHeight: 400,
      maxWidth: 400,
    );
    if (result != null) {
      final File file = File(
        result.path,
      );

      final imageSent = await chatFirebase.uploadImage(
          folderName: 'chat', file: file, imageName: id);
      final imagePath = await chatFirebase.downloadImage(
          'chat', imageSent.snapshot.ref.fullPath);

      ChatMessage message =
          ChatMessage(text: "", user: myInfo, image: imagePath);
      addMessage(message);
    } else {
      return null;
    }
  }

  Future<void> addMessage(ChatMessage message) {
    return chatFirebase.setMessage(message, getIds());
  }

  Future<ChatUser> getUserInfo() {
    return chatFirebase.userInfo();
  }

  Stream<List<ChatMessage>> getChats() {
    return chatFirebase.chatsStream(getIds());
  }

  String getIds() {
    return myInfo.uid + chatMateInfo.uid;
  }
}

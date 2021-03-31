import 'dart:io';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_picker/image_picker.dart';
import 'package:new_practice/models/ecommerce/fruit.dart';
import 'package:new_practice/models/ecommerce/fruit_total.dart';
import 'package:new_practice/services/login_services/firebase/firebase_chat.dart';
import 'package:rxdart/rxdart.dart';
import 'package:dash_chat/dash_chat.dart';

import 'main_bloc.dart';

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
  var messagesStream = BehaviorSubject<List<ChatMessage>>();

  final chatFirebase = Modular.get<FirebaseChat>();
  final mainBloc = Modular.get<MainBloc>();

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

      ChatMessage message = ChatMessage(
          text: "",
          user: myInfo,
          image: imagePath,
          createdAt: await mainBloc.getDateNowNTP());
      addMessage(message);
    } else {
      return null;
    }
  }

  Future<void> addMessage(ChatMessage message) async {
    message.createdAt = await mainBloc.getDateNowNTP();
    return chatFirebase.setMessage(message, getIds());
  }

  Future<ChatUser> getUserInfo() {
    return chatFirebase.userInfo();
  }

  Stream<List<ChatMessage>> zipStreamSample() {
    return ZipStream([
      chatFirebase.chatsStream(getReverseIds()),
      chatFirebase.chatsStream(getIds()),
    ], (a) {
      return a.first + a.last;
    });
  }

  Stream<List<ChatMessage>> getChats() {
    return MergeStream([
      chatFirebase.chatsStream(getIds()),
      chatFirebase.chatsStream(getReverseIds()),
      // getChats1()
    ]);
  }

  messagesListener() {
    List<ChatMessage> myMessages = [];
    List<ChatMessage> chatMateMessages = [];
    getChats().listen((x) {
      if (x.isEmpty) {
        return;
      }
      if (x.elementAt(0).user.uid == myInfo.uid) {
        myMessages = x;
      }
      if (x.elementAt(0).user.uid == chatMateInfo.uid) {
        chatMateMessages = x;
      }
      List<ChatMessage> test = [...myMessages, ...chatMateMessages];
      sortData(test);
      messages = [];

      messages.addAll(test);
    });
  }

  List<ChatMessage> sortData(List<ChatMessage> data) {
    if (data.isNotEmpty) {
      data.sort(
          (ChatMessage a, ChatMessage b) => a.createdAt.compareTo(b.createdAt));
    }
    return data;
  }

  String getIds() {
    return myInfo.uid + chatMateInfo.uid;
  }

  String getReverseIds() {
    return chatMateInfo.uid + myInfo.uid;
  }
}

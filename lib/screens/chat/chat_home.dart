import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/chat_bloc.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/models/uber_model/users.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';
import 'package:new_practice/services/login_services/firebase/firebase_user.dart';
import 'package:new_practice/utils/image/image_with_state.dart';
import 'package:new_practice/utils/list/item-list.widget.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

class ChatHome extends StatefulWidget {
  ChatHome({Key key}) : super(key: key);

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  final mainBloc = Modular.get<MainBloc>();
  final authBloc = Modular.get<AuthService>();
  final firebaseUser = FirebaseUsers.instance;
  final chatBloc = Modular.get<ChatBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [Text('profile'), Text('search'), _itemLists()],
        ),
      ),
    );
  }

  Widget _itemLists() {
    double height = MediaQuery.of(context).size.height * .50;
    return Container(
      height: height,
      child: StreamBuilder<List<Users>>(
          stream: firebaseUser.usersStream(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListItemsBuilder<Users>(
                  divided: false,
                  snapshot: snapshot,
                  itemBuilder: (context, req) {
                    if (req.uid == authBloc.getCurrentUserId()) {
                      final mainUser = ChatUser(
                          name: req.displayName,
                          uid: req.uid,
                          avatar: req.photoUrl);
                      chatBloc.myInfo = mainUser;
                      return Container(
                        height: 0,
                      );
                    }
                    ChatUser chatUser = ChatUser(
                        name: req.displayName,
                        avatar: req.photoUrl,
                        uid: req.uid);
                    return _list(chatUser);
                  });
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _list(ChatUser users) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(0.0),
        child: FittedBox(
          alignment: Alignment.centerLeft,
          fit: BoxFit.scaleDown,
          child: Column(
            children: [
              Row(
                children: [
                  users.avatar != null
                      ? ImageWithState(
                          height: 50,
                          width: 50,
                          futureUrl: getAvatar(users.avatar),
                          boxShape: BoxShape.circle,
                        )
                      : Container(
                          height: 50,
                          width: 50,
                          child: CircleAvatar(
                            child: Icon(Icons.image),
                          )),
                  SizedBox(width: 10),
                  Text(
                    users.name.contains('null') ? 'Anonymous' : users.name,
                    style: TextStyle1(size: 2.3.h, isBold: false),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        chatBloc.chatMateInfo = users;
        chatBloc.messages = [];
        Modular.link.pushNamed('/details');
      },
    );
  }

  Future<String> getAvatar(String avatar) {
    var complete = new Completer();
    complete.complete(avatar);
    return complete.future.then((t) => t.toString());
  }
}

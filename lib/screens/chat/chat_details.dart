import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dash_chat/dash_chat.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/chat_bloc.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/utils/image/image_url_as_future.dart';
import 'package:new_practice/utils/image/image_with_state.dart';
import 'package:new_practice/widgets/text/text_deco.dart';

class ChatDetails extends StatefulWidget {
  ChatDetails({Key key}) : super(key: key);

  @override
  ChatDetailsState createState() => ChatDetailsState();
}

class ChatDetailsState extends State<ChatDetails> {
  final GlobalKey<DashChatState> _chatViewKey = GlobalKey<DashChatState>();
  final chatBloc = Modular.get<ChatBloc>();
  final mainBloc = Modular.get<MainBloc>();
  // var m = List<ChatMessage>();

  // var i = 0;

  @override
  void initState() {
    super.initState();
  }

  void systemMessage() {
    Timer(Duration(milliseconds: 300), () {
      Timer(Duration(milliseconds: 300), () {
        _chatViewKey.currentState.scrollController
          ..animateTo(
            _chatViewKey.currentState.scrollController.position.maxScrollExtent,
            curve: Curves.easeOut,
            duration: const Duration(milliseconds: 300),
          );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    chatBloc.getChats();
    chatBloc.messagesListener();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        elevation: 0,
        backgroundColor: Colors.grey[50],
        titleSpacing: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {},
          )
        ],
        title: Row(
          children: [
            ImageWithState(
              height: 30,
              width: 30,
              futureUrl: imageUrlAsFuture(chatBloc.chatMateInfo.avatar),
              boxShape: BoxShape.circle,
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Text(
                chatBloc.chatMateInfo.name,
                style: TextStyle1(color: Colors.black, size: 16),
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder<List<ChatMessage>>(
          stream: chatBloc.getChats(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor,
                  ),
                ),
              );
            } else {
              print(snapshot.data);

              return DashChat(
                key: _chatViewKey,
                inverted: false,
                onSend: chatBloc.addMessage,
                sendOnEnter: true,
                textInputAction: TextInputAction.send,
                user: chatBloc.myInfo,
                inputDecoration:
                    InputDecoration.collapsed(hintText: "Add message here..."),
                dateFormat: DateFormat('MMM dd, yyyy'),
                timeFormat: DateFormat('h:mm a'),
                messages: chatBloc.messages,
                showUserAvatar: false,
                showAvatarForEveryMessage: false,
                scrollToBottom: true,
                onPressAvatar: (ChatUser user) {
                  print("OnPressAvatar: ${user.name}");
                },
                onLongPressAvatar: (ChatUser user) {
                  print("OnLongPressAvatar: ${user.name}");
                },
                inputMaxLines: 5,
                messageContainerPadding: EdgeInsets.only(left: 5.0, right: 5.0),
                alwaysShowSend: true,
                inputTextStyle: TextStyle(fontSize: 16.0),
                inputContainerStyle: BoxDecoration(
                  border: Border.all(width: 0.0),
                  color: Colors.white,
                ),
                onQuickReply: (Reply reply) async {
                  chatBloc.messages.add(ChatMessage(
                      // id: ,
                      text: reply.value,
                      createdAt: await mainBloc.getDateNowNTP(),
                      user: chatBloc.myInfo));
                  Timer(Duration(milliseconds: 300), () {
                    _chatViewKey.currentState.scrollController
                      ..animateTo(
                        _chatViewKey.currentState.scrollController.position
                            .maxScrollExtent,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );
                  });
                },
                onLoadEarlier: () {
                  print("laoding...");
                },
                shouldShowLoadEarlier: false,
                showTraillingBeforeSend: true,
                trailing: <Widget>[
                  IconButton(
                    icon: Icon(Icons.photo),
                    onPressed: () async {
                      chatBloc.sendImage();
                    },
                  )
                ],
                messageTimeBuilder: (a, [b]) {
                  return messageTimeBuilders(a, b);
                },
                messageImageBuilder: (a, [b]) {
                  return messageImageBuilders(a, b);
                },
                messageDecorationBuilder: (a, b) {
                  return messageDecorationBuilders(a, b);
                },
                messageContainerDecoration:
                    BoxDecoration(color: Colors.transparent),
              );
            }
          }),
    );
  }

  messageImageBuilders(String a, [ChatMessage b]) {
    return Container(
        child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ImageWithState(
        futureUrl: imageUrlAsFuture(a),
      ),
    ));
  }

  messageTimeBuilders(String a, [ChatMessage b]) {
    return Column(
      children: [
        SizedBox(
          height: 3,
        ),
        Text('${a.toLowerCase()}',
            style: TextStyle(
                fontSize: 10,
                color: b.user.uid == chatBloc.myInfo.uid && b.image == null
                    ? Colors.grey[100]
                    : Colors.black)),
      ],
    );
  }

  messageDecorationBuilders(ChatMessage a, bool b) {
    print('-------------------------------$b ${a.image}');
    return BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: a.image == null
            ? b
                ? Colors.blue
                : Colors.grey[300]
            : Colors.transparent);

    // if(a.user.uid == chatBloc.myInfo.uid) {

    // } else {

    // }

    // decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
    // child: ImageWithState(
    //   futureUrl: imageUrlAsFuture(a),
    // ));
  }
}

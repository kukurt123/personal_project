import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/widgets/text/text_deco.dart';

import 'meeting_create.dart';
import 'meeting_join.dart';

class Conference extends StatefulWidget {
  Conference({Key key}) : super(key: key);

  @override
  _ConferenceState createState() => _ConferenceState();
}

class _ConferenceState extends State<Conference>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  buildTab(String name) {
    return Container(
        width: 150,
        height: 50,
        child: Card(
            child: Center(
          child: Text(
            name,
            style: TextStyle1(size: 15, color: Colors.black, isBold: true),
          ),
        )));
  }

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Conference",
          style: TextStyle1(color: Colors.white, isBold: true, size: 25),
        ),
        bottom: TabBar(
          tabs: [buildTab("Join Meeting"), buildTab("Create Meeting")],
          controller: tabController,
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          MeetingJoin(),
          MeetingCreate(),
        ],
      ),
    );
  }
}

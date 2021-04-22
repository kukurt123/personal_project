import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/page1_3/page1_3rx.dart';
import 'package:new_practice/models/food.dart';
import 'main_drawer.dart';

class Page1_3 extends StatefulWidget {
  final Food foods;
  Page1_3({Key key, this.foods}) : super(key: key);

  @override
  _Page1_3State createState() => _Page1_3State();
}

class _Page1_3State extends State<Page1_3> {
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final data = Modular.get<Page1_3rx>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Page1_3'),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('PAGE 3'),
              Column(
                children: [
                  FormBuilder(
                    key: keyy,
                    onChanged: () {
                      data.pood.add(widget.foods.copyWith.call(
                          name: keyy.currentState.fields['name'].toString(),
                          price: 200.0));
                      print('changing....' + data.pood.value.name);
                    },
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'name',
                          initialValue: widget.foods.name,
                          decoration: InputDecoration(
                              labelText: 'Name',
                              icon: Icon(Icons.near_me_sharp)),
                        )
                      ],
                    ),
                  ),
                  Text('' + data.pood.value.price.toString())
                ],
              ),
              ButtonBar(
                children: [
                  // Text('CLICK ME'),

                  // Card(
                  FlatButton(
                    child: Icon(Icons.change_history_outlined),
                    onPressed: () {},
                  ),
                  // ),
                ],
              ),
            ]),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            // Navigator.pop(context);
            Modular.to.pushNamed('/page1/page3/page2');
          },
        ));
  }
}

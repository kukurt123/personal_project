import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/page1_1/page1_1_barrel.dart';
import 'package:new_practice/bloc/page1_3/page1_3rx.dart';
import 'package:new_practice/models/food.dart';

import 'main_drawer.dart';

class Page1_1 extends StatelessWidget {
  Page1_1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final page13rx = Modular.get<Page1_3rx>();
    Page1Bloc appBloc = Modular.get<Page1Bloc>();
    final nameController = TextEditingController();

    final priceController = TextEditingController();
    final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

    return Scaffold(
        appBar: AppBar(
          title: Text('Page1_1'),
        ),
        drawer: MainDrawer(),
        body: Padding(
          padding: EdgeInsets.all(25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              appBloc.state.when(
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
                calculate: () => Center(child: Text('Now Calcutating...')),
                error: () => Center(child: Text('Now Error....')),
              ),
              StreamBuilder(
                  stream: page13rx.pood.stream,
                  builder: (context, snapshot) {
                    Food food = snapshot.data;
                    print('dataaaaa' + page13rx.pood.value.toString());
                    return FormBuilder(
                      key: _fbKey,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      child: Column(
                        children: [
                          FormBuilderTextField(
                            controller: nameController,
                            name: 'name',
                            decoration: InputDecoration(
                                labelText: 'Name',
                                icon:
                                    Icon(Icons.supervised_user_circle_rounded),
                                border: OutlineInputBorder()),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          FormBuilderTextField(
                            controller: priceController,
                            name: 'tex',
                            decoration: InputDecoration(
                                labelText: 'Score',
                                icon: Icon(Icons.score),
                                border: OutlineInputBorder()),
                            validator: FormBuilderValidators.compose([
                              FormBuilderValidators.required(context),
                              (val) {
                                if (_fbKey.currentState.fields['tex']?.value
                                        .toString()
                                        .trim()
                                        .length <
                                    2) {
                                  return 'text too short';
                                }
                                return null;
                              }
                            ]),
                          ),
                        ],
                      ),
                    );
                  }),
              Row(
                children: [
                  MaterialButton(
                    color: Theme.of(context).accentColor,
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _fbKey.currentState.save();
                      if (_fbKey.currentState.validate()) {
                        print('saved');
                      } else {
                        print('not saved!');
                      }
                    },
                  )
                ],
              ),
            ],
          ),
        ),
        extendBodyBehindAppBar: true,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink,
          onPressed: () {
            print('im click now!');
            appBloc.add(Page1EventClicked());

            page13rx.openDetails(
              food: new Food(
                  name: nameController.text,
                  price: double.parse(priceController.text)),
            );
            Modular.link.pushNamed('/page3', arguments: page13rx.pood.value);
          },
        ));
  }
}

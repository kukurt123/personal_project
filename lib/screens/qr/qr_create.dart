import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/qr_bloc.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/services/login_services/firebase/firebase-qr.dart/firestore_qr.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:sizer/sizer.dart';

class QrCreate extends StatefulWidget {
  final FirestoreQr firestoreQr;
  QrCreate({Key key, this.firestoreQr}) : super(key: key);

  @override
  _QrCreateState createState() => _QrCreateState();
}

class _QrCreateState extends State<QrCreate> {
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final requestController = TextEditingController();
  final paymentController = TextEditingController();
  final nameController = TextEditingController();
  final data = Modular.get<QrBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('Send your medical request',
                  style: TextStyle1(size: 25, isBold: true)),
              FormBuilder(
                key: keyy,
                onChanged: () {},
                child: Column(
                  children: [
                    FormBuilderTextField(
                      controller: nameController,
                      name: 'name',
                      decoration: InputDecoration(
                          labelText: 'Name', icon: Icon(Icons.person)),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    FormBuilderTextField(
                      controller: requestController,
                      name: 'request',
                      decoration: InputDecoration(
                          labelText: 'Request',
                          icon: Icon(Icons.medical_services_outlined)),
                    ),
                    SizedBox(
                      height: 3.0.h,
                    ),
                    FormBuilderTextField(
                      controller: paymentController,
                      keyboardType: TextInputType.number,
                      name: 'payment',
                      decoration: InputDecoration(
                          labelText: 'Payment', icon: Icon(Icons.money)),
                    ),
                  ],
                ),
              ),
              RaisedButton(
                padding: EdgeInsets.all(0.0),
                shape: StadiumBorder(),
                textColor: Colors.white,
                onPressed: () async {
                  if (nameController.text.isEmpty ||
                      paymentController.text.isEmpty ||
                      requestController.text.isEmpty) {
                    return BotToast.showText(text: 'Fill up all fields');
                  }
                  final qr = new RequestQr(
                      id: docIdFromCurrentDate(),
                      name: nameController.text,
                      payment: int.parse(paymentController.text),
                      request: requestController.text);
                  await widget.firestoreQr.setJob(qr);
                  keyy.currentState.reset();
                },
                child: Container(
                  child: Text('SUBMIT', style: TextStyle(fontSize: 15.0)),
                  padding: EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: LinearGradient(colors: <Color>[
                        Color(0xFFFF2F00),
                        Color(0xFFF2731E),
                      ])),
                ),
              ),
            ]),
      ),
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.pink,
      //   onPressed: () {
      //     // Navigator.pop(context);
      //     Modular.to.pushNamed('/page1/page3/page2');
      //   },
      // )
    );
  }
}

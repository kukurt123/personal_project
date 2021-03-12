import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/qr_bloc.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/services/login_services/firebase/firebase-qr.dart/firestore_qr.dart';
import 'package:new_practice/widgets/text/text_deco.dart';

class QrDetails extends StatefulWidget {
  final FirestoreQr firestoreQr;
  QrDetails({
    Key key,
    this.firestoreQr,
  }) : super(key: key);

  @override
  _QrDetailsState createState() => _QrDetailsState();
}

class _QrDetailsState extends State<QrDetails> {
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final data = Modular.get<QrBloc>();
  final paymentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    data.done = false;
    return Scaffold(
      // backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Proceed Payment'),
      ),
      body: StreamBuilder<RequestQr>(
          stream: widget.firestoreQr.requestStream(requestId: data.id),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final result = snapshot.data;
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Request Info",
                          style: TextStyle1(size: 25, color: Colors.grey),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.person),
                                  SizedBox(width: 5),
                                  Text(
                                    "Name:",
                                    style: TextStyle1(size: 15),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    result.name,
                                    style: TextStyle1(size: 20, isBold: true),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.medical_services_outlined),
                                  SizedBox(width: 5),
                                  Text(
                                    "Request:",
                                    style: TextStyle1(size: 15),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    result.request,
                                    style: TextStyle1(size: 20, isBold: true),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.money),
                                  SizedBox(width: 5),
                                  Text(
                                    "Payment:",
                                    style: TextStyle1(size: 15),
                                  ),
                                  SizedBox(width: 20),
                                  Text(
                                    result.payment.toString(),
                                    style: TextStyle1(size: 20, isBold: true),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Transaction Info",
                          style: TextStyle1(size: 25, color: Colors.grey),
                        ),
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.check),
                                  SizedBox(width: 5),
                                  Text(
                                    "Cash:",
                                    style: TextStyle1(size: 15),
                                  ),
                                  SizedBox(width: 20),
                                  // TextField(
                                  //   controller: paymentController,
                                  //   decoration: InputDecoration(
                                  //       labelText: 'Alias',
                                  //       // hasFloatingPlaceholder: true,
                                  //       hintText: "Alias",
                                  //       focusedBorder: OutlineInputBorder(
                                  //           borderSide: BorderSide(
                                  //               color: Colors.green)),
                                  //       // icon: Icon(Icons.score),
                                  //       border: OutlineInputBorder()),
                                  // )
                                ],
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.check),
                                  SizedBox(width: 10),
                                  Text(
                                    "Change:",
                                    style: TextStyle1(size: 15),
                                  ),
                                  SizedBox(width: 20),
                                  // Text(
                                  //   result.request,
                                  //   style: TextStyle1(size: 20, isBold: true),
                                  // )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      RaisedButton(
                        padding: EdgeInsets.all(0.0),
                        shape: StadiumBorder(),
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Container(
                          child: Text('PAID', style: TextStyle(fontSize: 15.0)),
                          padding: EdgeInsets.symmetric(
                              horizontal: 70, vertical: 15),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25.0),
                              gradient: LinearGradient(colors: <Color>[
                                Color(0xFFFF2F00),
                                Color(0xFFF2731E),
                              ])),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

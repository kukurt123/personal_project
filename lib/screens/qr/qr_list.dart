import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/qr_bloc.dart';
import 'package:new_practice/models/qr/requestqr.dart';
import 'package:new_practice/services/login_services/firebase/firebase-qr.dart/firestore_qr.dart';
import 'package:new_practice/widgets/qr/item_widget_builder.dart';
import 'package:new_practice/widgets/text/text_deco.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrList extends StatefulWidget {
  final FirestoreQr firestoreQr;
  QrList({Key key, this.firestoreQr}) : super(key: key);

  @override
  _QrListState createState() => _QrListState();
}

class _QrListState extends State<QrList> {
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final data = Modular.get<QrBloc>();
  // final firestoreQr = Modular.get<FirestoreQr>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('List'),
        ),
        body: Container(
            padding: EdgeInsets.only(bottom: 50),
            child: _buildContents(context)));
  }

  Widget _buildContents(BuildContext context) {
    return StreamBuilder<List<RequestQr>>(
        stream: widget.firestoreQr.requestsStream(),
        builder: (context, snapshot) {
          return ListItemsBuilder<RequestQr>(
              snapshot: snapshot,
              itemBuilder: (context, req) => Dismissible(
                  key: Key('job-${req.id}'),
                  background: Container(color: Colors.blue[900]),
                  direction: DismissDirection.endToStart,
                  // onDismissed: (direction) => print('deleted'),
                  child: RequestPageTile(
                      req: req,
                      onTap: () {
                        data.id = req.id;
                        Modular.link.pushNamed('/details',
                            arguments: widget.firestoreQr);
                      })));
        });
  }
}

class RequestPageTile extends StatelessWidget {
  const RequestPageTile({Key key, @required this.req, this.onTap})
      : super(key: key);
  final RequestQr req;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person),
                SizedBox(width: 10),
                Text(
                  req.name,
                  style: TextStyle1(size: 20, isBold: true),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            QrImage(
              embeddedImage: AssetImage('assets/images/smc.png'),
              embeddedImageStyle: QrEmbeddedImageStyle(
                size: Size(30, 30),
              ),
              data: req.id,
              version: QrVersions.auto,
              size: 320,
              gapless: false,
            ),
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

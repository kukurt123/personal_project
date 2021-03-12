import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/qr_bloc.dart';
import 'package:new_practice/services/login_services/firebase/firebase-qr.dart/firestore_qr.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QrRead extends StatefulWidget {
  final FirestoreQr firestoreQr;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QrRead({
    Key key,
    this.firestoreQr,
  }) : super(key: key);

  @override
  _QrReadState createState() => _QrReadState();
}

class _QrReadState extends State<QrRead> {
  Barcode result;
  QRViewController controller;
  final GlobalKey<FormBuilderState> keyy = GlobalKey<FormBuilderState>();
  final data = Modular.get<QrBloc>();
  bool stop = false;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.pauseCamera();
    }
    controller.resumeCamera();
  }

  @override
  Widget build(BuildContext context) {
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    return Scaffold(
      body: QRView(
        key: widget.qrKey,
        onQRViewCreated: _onQRViewCreated,
        overlay: QrScannerOverlayShape(
            borderColor: Colors.red,
            borderRadius: 10,
            borderLength: 30,
            borderWidth: 10,
            cutOutSize: scanArea),
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        Barcode scan = scanData;
        data.id = scan.code;
        if (scan != null && !stop) {
          stop = true;
          controller.pauseCamera();
          Modular.link.pushNamed('/details', arguments: widget.firestoreQr);
          Future.delayed(Duration(seconds: 2), () {
            controller.resumeCamera();
            stop = false;
            print('yo hey');
          });
        }
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

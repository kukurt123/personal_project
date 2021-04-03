import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:new_practice/utils/loading/progress_dialog.dart';
import 'package:time/time.dart';
import 'package:logger/logger.dart';

class LoadingUtil {
  var logger = Logger(
    printer: PrettyPrinter(),
  );

  bool loaded = false;
  bool loading = false;
  BuildContext buildContext;

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.doubleBounce
      ..loadingStyle = EasyLoadingStyle.light
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.black
      ..backgroundColor = Colors.white
      ..indicatorColor = Colors.black
      ..textColor = Colors.black
      ..maskType = EasyLoadingMaskType.black
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = false
      ..dismissOnTap = false;

    loaded = true;
    // ..customAnimation = CustomAnimation();
  }

  showLoading(String str) async {
    logger.e('ari gid....${EasyLoading.isShow}');
    // if (isLoading()) {
    EasyLoading.show(
      status: str,
      maskType: EasyLoadingMaskType.clear,
    );
    await 2.seconds.delay;
    dismiss();
    // }
  }

  Widget widgetLoading(Widget home) {
    if (loaded == false) {
      configLoading();
    }

    return MaterialApp(home: home);
  }

  bool hasLoaded() {
    return loaded;
  }

  easyLoadingInit() {
    if (loaded == false) {
      configLoading();
    }
    return EasyLoading.init();
  }

  dismiss() async {
    // if (loading == true) {
    // await 2.seconds.delay;
    await EasyLoading.dismiss();
    // }
  }

  bool isLoading() {
    return EasyLoading.isShow;
  }

  showDialogz(BuildContext context) {
    buildContext = context;
    showDialog(
        useRootNavigator: true,
        context: buildContext,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return ProgressDialog(message: 'Loading na....');
        });
  }

  closeDialogz() {
    Navigator.pop(buildContext);
  }
}

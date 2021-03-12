import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';

class ConvertError {
  String message(PlatformException exception) {
    if (exception.message == 'FIRFirestoreErrorDomain') {
      if (exception.code == 'Error 7') {
        return 'Missing or insufficient permissions';
      }
    }
    return _errors[exception.code] ?? exception.message;
  }

  Map<String, String> _errors = {
    'ERROR_WEAK_PASSWORD': 'password is not strong enough.',
    'ERROR_INVALID_EMAIL': 'email address is malformed.',
    'ERROR_EMAIL_ALREADY_IN_USE':
        'email is already in use by a different account.',
    'ERROR_WRONG_PASSWORD': '[password] is wrong.',
    'ERROR_USER_NOT_FOUND': 'No user corresponding to the given account',
    'ERROR_USER_DISABLED':
        'user has been disabled (for example, in the Firebase console)',
    'ERROR_TOO_MANY_REQUESTS':
        'If there was too many attempts to sign in as this user.',
    'ERROR_OPERATION_NOT_ALLOWED':
        'Indicates that Email & Password accounts are not enabled.'
  };
}

Future<void> confirmDialogUtil(
    BuildContext context, List<String> array, VoidCallback callback) async {
  showPlatformDialog(
    context: context,
    builder: (context) => PlatformAlertDialog(
      title: Text(array[0]),
      content: Text(array[1]),
      actions: <Widget>[
        FlatButton(
          child: Text('Cancel'),
          onPressed: () => Navigator.of(context).pop(),
        ),
        FlatButton(
          child: PlatformText('Yes'),
          onPressed: () {
            callback();
            // print('closed...');
            print('closed...');
            // Navigator.of(context).pop();
          },
        ),
      ],
      cupertino: (context, __) => CupertinoAlertDialogData(),
      material: (context, __) => MaterialAlertDialogData(),
    ),
  );
}

Future<void> infoDialogUtil(BuildContext context, List<String> array) async {
  showPlatformDialog(
    context: context,
    builder: (context) => PlatformAlertDialog(
      title: Text(array[0]),
      content: Text(array[1]),
      actions: <Widget>[
        FlatButton(
          child: Text('Close'),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ],
      cupertino: (context, __) => CupertinoAlertDialogData(),
      material: (context, __) => MaterialAlertDialogData(),
    ),
  );
}

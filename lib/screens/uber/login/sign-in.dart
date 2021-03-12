import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/screens/uber/login/sign-in-manager.dart';
import 'package:new_practice/utils/alert-dialog/alert-dialogs.dart';
import 'package:new_practice/utils/button/custom-button.dart';
import 'package:smart_select/smart_select.dart';

class SignIn extends StatefulWidget {
  // const SignIn({Key key, @required this.manager, @required this.isLoading})
  //     : super(key: key);
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final manager = Modular.get<SignInManager>();
  final roleValue = '';

  bool isLoading = true;

  Future<void> anon(BuildContext context) async {
    // print('auth from signinmanager....' +
    //     (manager.auth.value == null).toString());
    try {
      await manager.anonymousLogin();
    } on PlatformException catch (e) {
      infoDialogUtil(context, ['Login Failed', ConvertError().message(e)]);
    }
  }

  Future<void> signinWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } catch (e) {
      // print(e);
      infoDialogUtil(context, ['Login Failed', ConvertError().message(e)]);
    }
  }

  Future<void> signinWithFacebook(BuildContext context) async {
    try {
      await manager.signInWithFacebook();
    } catch (e) {
      infoDialogUtil(context, ['Login Failed', ConvertError().message(e)]);
    }
  }

  void _signInWithEmail() {
    Modular.link.pushNamed('/email');
  }

  @override
  Widget build(BuildContext context) {
    manager.setIsLoading(false);
    isLoading = manager.isLoading.value;
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign in'),
        elevation: 3,
      ),
      body:
          // Container(child: Text('')),
          signInContainer(context),
      backgroundColor: Colors.grey.shade200,
    );
  }

  Widget signInContainer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 50.0, child: _buildHeader()),
          SizedBox(height: 50),
          SocialSignInButton(
            assetName: 'assets/images/google-logo.png',
            color: Colors.white,
            text: 'Sign in with Google',
            textColor: Colors.black87,
            onPressed: isLoading ? null : () => signinWithGoogle(context),
          ),
          SizedBox(height: 8),
          SocialSignInButton(
            assetName: 'assets/images/facebook-logo.png',
            color: Colors.blue.shade900,
            text: 'Sign in with Facebook',
            textColor: Colors.white,
            onPressed: isLoading ? null : () => signinWithFacebook(context),
          ),
          SizedBox(height: 8),
          SignInButton(
            color: Colors.green.shade700,
            text: 'Sign in with email',
            textColor: Colors.white,
            onPressed: isLoading ? null : () => _signInWithEmail(),
          ),
          // SizedBox(height: 8),
          // Text(
          //   'or',
          //   textAlign: TextAlign.center,
          // ),
          SizedBox(height: 8),
          SignInButton(
            color: Colors.lime,
            text: 'Go anonymous',
            textColor: Colors.black87,
            onPressed: () => anon(context),
          ),
          SizedBox(height: 16),
          SmartSelectBasic(),
        ],
      ),
    );
  }

  // bool onLoginPressed() {
  //   return roleValue.isEmpty ?  infoDialogUtil(context, ['Woops!', 'Loggi'])
  // }

  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Text(
      'Sign in',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class SmartSelectBasic extends StatefulWidget {
  SmartSelectBasic({
    Key key,
  }) : super(key: key);

  @override
  _SmartSelectBasicState createState() => _SmartSelectBasicState();
}

class _SmartSelectBasicState extends State<SmartSelectBasic> {
  String value = 'Customer';
  List<S2Choice<String>> options = [
    S2Choice<String>(value: '1', title: 'Customer'),
    S2Choice<String>(value: '2', title: 'Rider'),
  ];

  @override
  Widget build(BuildContext context) {
    return SmartSelect<String>.single(
        tileBuilder: (context, state) {
          final value = state.valueDisplay.characters.toString();
          return S2Tile(
            body: Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
            ),
            trailing: value == "Rider"
                ? Padding(
                    padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                    child: Icon(Icons.directions_bike))
                : value == "Customer"
                    ? Padding(
                        padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Icon(Icons.person))
                    : null,
            title: state.titleWidget,
            value: state.valueDisplay,
            onTap: state.showModal,
          );
        },
        modalType: S2ModalType.popupDialog,
        choiceStyle: S2ChoiceStyle(color: Theme.of(context).primaryColor),
        title: 'Logged in as',
        value: "1",
        choiceItems: options,
        onChange: (state) => setState(() => value = state.value));
  }
}

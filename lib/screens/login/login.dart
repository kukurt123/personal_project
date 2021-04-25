import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_fresh/login_fresh.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:new_practice/models/uber_model/email-sign-in-change.model.dart';
import 'package:new_practice/screens/uber/login/sign-in-manager.dart';
import 'package:new_practice/utils/alert-dialog/alert-dialogs.dart';
import 'package:new_practice/utils/button/custom-button.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final manager = Modular.get<SignInManager>();
  final roleValue = '';

  bool isLoading = true;

  Future<void> anon(BuildContext context) async {
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
    return Scaffold(body: buildLoginFresh());
  }

  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            isLoading ? null : signinWithFacebook(context);
          },
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            isLoading ? null : signinWithGoogle(context);
          },
          logo: TypeLogo.google),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            print("APPLE");
            // develop what they want the Apple to do when the user clicks
          },
          logo: TypeLogo.apple),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Navigator.of(_buildContext).push(MaterialPageRoute(
              builder: (_buildContext) => widgetLoginFreshUserAndPassword(),
            ));
          },
          logo: TypeLogo.userPassword),
    ];

    return LoginFresh(
      pathLogo: 'assets/images/icon.png',
      backgroundColor: Theme.of(context).primaryColor,
      functionExploreApp: () {
        // develop what they want the ExploreApp to do when the user clicks
      },
      // isFooter: true,
      widgetFooter: this.widgetFooter(),
      typeLoginModel: listLogin,
      isSignUp: true,
      widgetSignUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetLoginFreshUserAndPassword() {
    return LoginFreshUserAndPassword(
      callLogin: (BuildContext _context, Function isRequest, String user,
          String password) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      logo: 'assets/images/icon.png',
      isFooter: false,
      backgroundColor: Colors.blue,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/images/icon.png',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          isRequest(false);
        });
      },
      isFooter: false,
      backgroundColor: Colors.white,
      widgetFooter: this.widgetFooter(),
    );
  }

  Widget widgetFooter() {
    return LoginFreshFooter(
      logo: 'assets/images/icon.png',
      text: 'Power by',
      funFooterLogin: () {},
    );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
        backgroundColor: Theme.of(context).primaryColor,
        isFooter: false,
        widgetFooter: this.widgetFooter(),
        logo: 'assets/images/icon.png',
        funSignUp: (BuildContext _context, Function isRequest,
            SignUpModel signUpModel) {
          isRequest(true);
          isRequest(false);
        });
  }

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

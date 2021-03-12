import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:login_fresh/login_fresh.dart';

class Login extends StatefulWidget {
  //You have to create a list with the type of login's that you are going to import into your application

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildLoginFresh());
  }

  LoginFresh buildLoginFresh() {
    List<LoginFreshTypeLoginModel> listLogin = [
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            Modular.to.popAndPushNamed('main');
            print('FB clicked/....');
            // develop what they want the facebook to do when the user clicks
          },
          logo: TypeLogo.facebook),
      LoginFreshTypeLoginModel(
          callFunction: (BuildContext _buildContext) {
            // print('facebook');

            // develop what they want the Google to do when the user clicks
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
      pathLogo: 'assets/images/resto1.jpg',
      isExploreApp: true,
      functionExploreApp: () {
        // develop what they want the ExploreApp to do when the user clicks
      },
      isFooter: true,
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
          print('-------------- function call----------------');
          print(user);
          print(password);
          print('-------------- end call----------------');

          isRequest(false);
        });
      },
      logo: 'assets/images/resto1.jpg',
      isFooter: true,
      widgetFooter: this.widgetFooter(),
      isResetPassword: true,
      widgetResetPassword: this.widgetResetPassword(),
      isSignUp: true,
      signUp: this.widgetLoginFreshSignUp(),
    );
  }

  Widget widgetResetPassword() {
    return LoginFreshResetPassword(
      logo: 'assets/images/resto1.jpg',
      funResetPassword:
          (BuildContext _context, Function isRequest, String email) {
        isRequest(true);

        Future.delayed(Duration(seconds: 2), () {
          print('-------------- function call----------------');
          print(email);
          print('-------------- end call----------------');
          isRequest(false);
        });
      },
      isFooter: true,
      widgetFooter: this.widgetFooter(),
    );
  }

  Widget widgetFooter() {
    return LoginFreshFooter(
      logo: 'assets/images/resto1.jpg',
      text: 'Power by',
      funFooterLogin: () {
        // develop what they want the footer to do when the user clicks
      },
    );
  }

  Widget widgetLoginFreshSignUp() {
    return LoginFreshSignUp(
        isFooter: true,
        widgetFooter: this.widgetFooter(),
        logo: 'assets/images/resto1.jpg',
        funSignUp: (BuildContext _context, Function isRequest,
            SignUpModel signUpModel) {
          isRequest(true);

          print(signUpModel.email);
          print(signUpModel.password);
          print(signUpModel.repeatPassword);
          print(signUpModel.surname);
          print(signUpModel.name);

          isRequest(false);
        });
  }
}

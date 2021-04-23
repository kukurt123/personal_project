import 'dart:ui';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/mock_data/social_media.dart';
import 'package:new_practice/widgets/clip_paths/curve_clipper.dart';

class SocialLogin extends StatelessWidget {
  final nameController = TextEditingController();
  final priceController = TextEditingController();
  // final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  SocialLogin({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainBloc = Modular.get<MainBloc>();
    return Scaffold(
      bottomSheet: Container(
        child: Material(
          child: InkWell(
            splashColor: Colors.blue[900],
            // highlightColor: Colors.amber,
            onTap: () {
              BotToast.showText(text: "I'm a dummy button");
            },
            child: Container(
              // color: Theme.of(context).primaryColor,
              height: 100,
              child: Center(
                child: Text(
                  "Don't have an account? Sign up",
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                ),
              ),
            ),
          ),
          color: Theme.of(context).primaryColor,
        ),
      ),

      //
      // appBar: AppBar(
      //   title: Text('Social Media'),
      // ),
      body: Container(
        child: Column(
          children: [
            ClipPath(
              clipper: CurveClipper(),
              child: Image(
                height: 200.0,
                width: MediaQuery.of(context).size.width,
                image: AssetImage('assets/images/login_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'SOCIAL UI',
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 40.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 8),
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: ButtonTheme(
                  minWidth: 300,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      print('navigate to home...');
                      Modular.link.pushReplacementNamed('/home');
                    },
                    color: Theme.of(context).primaryColor,
                    child: Text('Proceed',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold)),
                  ),
                )),
          ],
        ),
      ),
    );
    // FormBuilder(
    //   key: _fbKey,
    //   autovalidateMode: AutovalidateMode.onUserInteraction,
    //   child: Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: Column(
    //       children: [
    // FormBuilderTextField(
    //   controller: nameController,
    //   attribute: 'username',
    //   decoration: InputDecoration(
    //       labelText: 'Username',
    //       prefixIcon: Icon(Icons.account_circle),
    //       filled: true,
    //       fillColor: Colors.white),
    // ),
    // SizedBox(
    //   height: 30,
    // ),
    // FormBuilderTextField(
    //   controller: priceController,
    //   attribute: 'password',
    //   decoration: InputDecoration(
    //     filled: true,
    //     fillColor: Colors.white,
    //     labelText: 'Password',
    //     prefixIcon: Icon(
    //       Icons.lock,
    //     ),
    // border: OutlineInputBorder()
    // ),
    // validator: FormBuilderValidators.compose([
    //   FormBuilderValidators.required(context),
    //   (val) {
    //     if (_fbKey.currentState.fields['tex']?.value
    //             .toString()
    //             .trim()
    //             .length <
    //         2) {
    //       return 'text too short';
    //     }
    //     return null;
    //   }
    // ]),
    // ),
    //       SizedBox(
    //         height: 40,
    //       ),
    //       ButtonTheme(
    //         minWidth: 300,
    //         height: 50,
    //         child: RaisedButton(
    //           shape: RoundedRectangleBorder(
    //               borderRadius: BorderRadius.circular(10)),
    //           onPressed: () {
    //             print('navigate to home...');
    //             mainBloc.changeUser(user: currentUser2);
    //             Modular.link.pushReplacementNamed('/home');
    //           },
    //           color: Theme.of(context).primaryColor,
    //           child: Text('Login',
    //               style: TextStyle(
    //                   color: Colors.white,
    //                   fontSize: 20.0,
    //                   fontWeight: FontWeight.bold)),
    //         ),
    //       )
    // ],
    // ),
    //     ),
    //         ),
    //       ),
    //     ],
    //   ),
    // ),
  }
}

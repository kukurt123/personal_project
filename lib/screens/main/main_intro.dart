import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/bloc/zoom_bloc.dart';
import 'package:new_practice/services/login_services/auth/auth.dart';

class MainIntro extends StatefulWidget {
  const MainIntro({Key key}) : super(key: key);

  @override
  _MainIntroState createState() => _MainIntroState();
}

class _MainIntroState extends State<MainIntro> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final auth = Modular.get<AuthService>();
  final mainBloc = Modular.get<MainBloc>();

  void _onIntroEnd(context) {
    mainBloc.openIntro.add(true);
  }

  Widget _buildImage(String assetName) {
    // final image = SvgPicture.asset()
    return Align(
      child: SvgPicture.asset('assets/images/$assetName.svg', width: 350.0),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Hi there!",
          body: "Thanks for checking out!",
          image: _buildImage('intro0'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Yes, its Online",
          body:
              "Some pages uses paid online server. Please be gente on the amount of stuff you are adding",
          image: _buildImage('intro1'),
          footer: RaisedButton(
            onPressed: () {
              introKey.currentState?.animateScroll(0);
            },
            child: const Text(
              'go back to previous',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.lightBlue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Enjoy!",
          bodyWidget: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text("Hope you check out everything", style: bodyStyle),
              // Icon(Icons.edit),
              // Text(" to edit a post", style: bodyStyle),
            ],
          ),
          image: _buildImage('intro2'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      //onSkip: () => _onIntroEnd(context), // You can override onSkip callback
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Icon(Icons.arrow_forward),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}

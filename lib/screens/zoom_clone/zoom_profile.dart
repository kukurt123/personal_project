import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/mock_data/social_media.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:sizer/sizer.dart';

class ZoomProfile extends StatelessWidget {
  const ZoomProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('mediaqueries');
    // print(MediaQuery.of(context).size.width / 3);
    print(MediaQuery.of(context).size.height / 10);
    // print(MediaQuery.of(context).size.aspectRatio);
    // print(MediaQuery.of(context).devicePixelRatio);
    // print(MediaQuery.of(context).);
    return Container(
      child: Column(
        children: [
          Stack(
            // alignment: Alignment.center,
            children: <Widget>[
              ClipPath(
                  clipper: ProfileClipper(),
                  child: Container(
                    width: double.infinity,
                    height: 33.33.h,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: GradientColors.facebookMessenger)),
                  )),
              Positioned(
                  top: MediaQuery.of(context).size.height / 10,
                  right: MediaQuery.of(context).size.width / 3,
                  child: Container(
                    height: 30.0.h,
                    width: 30.0.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                        border: Border.all(
                            width: 2, color: Theme.of(context).primaryColor),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(currentUser.profileImageUrl))),
                  ))
            ],
          ),
          SizedBox(
            height: 10.0.h,
          ),
          Text(
            currentUser.name,
            style: TextStyle(fontSize: 50.0.sp, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 5.0.h,
          ),
          RaisedButton(
            padding: EdgeInsets.all(0.0),
            shape: StadiumBorder(),
            textColor: Colors.white,
            onPressed: () {},
            child: Container(
              child: Text('EDIT PROFILE', style: TextStyle(fontSize: 2.0.h)),
              padding:
                  EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 2.3.h),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(2.0.w),
                  gradient: LinearGradient(colors: <Color>[
                    Color(0xFFFF2F00),
                    Color(0xFFF2731E),
                  ])),
            ),
          )
        ],
      ),
    );
  }
}

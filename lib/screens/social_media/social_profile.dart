import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_practice/bloc/main_bloc.dart';
import 'package:new_practice/widgets/carousel_animation.dart';
import 'package:new_practice/widgets/clip_paths/profile_clipper.dart';

class SocialProfile extends StatelessWidget {
  const SocialProfile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = Modular.get<MainBloc>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              // alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: ProfileClipper(),
                  child: Image(
                    image:
                        AssetImage(data.currentUser.value.backgroundImageUrl),
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 200,
                  top: 20,
                  child: IconButton(
                    color: Colors.white,
                    iconSize: 30,
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                Positioned(
                    bottom: 1,
                    right: 200,
                    child: Container(
                      height: 100,
                      width: 100,
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
                              image: AssetImage(
                                  data.currentUser.value.profileImageUrl))),
                    ))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              '${data.currentUser.value.name}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Text(
                      'Following',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                    Text(
                      '${data.currentUser.value.following}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    Text(
                      'Followers',
                      style: TextStyle(color: Colors.grey[600], fontSize: 20),
                    ),
                    Text(
                      '${data.currentUser.value.followers}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              width: 50,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                child: Text(
                  'Your Posts',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CarouselAnimation(
              posts: data.currentUser.value.posts,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
                child: Text(
                  'Your Favorites',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            CarouselAnimation(
              posts: data.currentUser.value.favorites,
            ),
          ],
        ),
      ),
    );
  }
}

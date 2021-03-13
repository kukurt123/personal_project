import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:new_practice/models/social_media/socialpost.dart';

class CarouselAnimation extends StatelessWidget {
  List<SocialPost> posts = [];

  CarouselAnimation({this.posts});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        aspectRatio: 2.0,
        height: 400,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        initialPage: 0,
        autoPlay: true,
      ),
      items: lists(context),
    );
  }

  List<Widget> lists(BuildContext context) {
    print('lists${posts.length}');

    List<Widget> list = [];
    posts.forEach((item) {
      list.add(Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: Stack(
              fit: StackFit.passthrough,
              children: <Widget>[
                Image.asset(item.imageUrl, fit: BoxFit.fitHeight),
                Positioned(
                  bottom: 0.0,
                  left: 0.0,
                  right: 0.0,
                  child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              item.location,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      item.likes.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.comment,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                    SizedBox(width: 6.0),
                                    Text(
                                      item.comments.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ])),
                ),
              ],
            )),
      ));
    });
    return list.toList();
  }
}

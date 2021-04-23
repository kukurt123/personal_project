import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:extended_image/extended_image.dart';
// import 'package:extended_image_library/extended_image_library.dart';

class ImageWithState extends StatelessWidget {
  final Future<String> futureUrl;
  final double height;
  final double width;
  final BoxShape boxShape;

  const ImageWithState(
      {Key key, this.futureUrl, this.height, this.width, this.boxShape})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final _controller = AnimationController(vsync: );
    if (futureUrl == null) {
      return CircularProgressIndicator();
    }

    return FutureBuilder<String>(
        future: futureUrl,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ExtendedImage.network(
              snapshot.data,
              width: width,
              height: height,
              fit: BoxFit.cover,
              enableMemoryCache: true,
              shape: boxShape,
              cache: true,
              loadStateChanged: (ExtendedImageState state) {
                // print('url    $url');
                switch (state.extendedImageLoadState) {
                  case LoadState.loading:
                    // _controller.reset();
                    return Image.asset(
                      "assets/images/logo1.png",
                      fit: BoxFit.fill,
                    );
                    break;

                  ///if you don't want override completed widget
                  ///please return null or state.completedWidget
                  //return null;
                  //return state.completedWidget;
                  case LoadState.completed:
                    // _controller.forward();
                    return ExtendedRawImage(
                      image: state.extendedImageInfo?.image,
                      width: width,
                      height: height,
                    );
                    break;
                  case LoadState.failed:
                    // _controller.reset();
                    return GestureDetector(
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          // Image.asset(
                          //   "assets/failed.jpg",
                          //   fit: BoxFit.fill,
                          // ),
                          Positioned(
                            bottom: 0.0,
                            left: 0.0,
                            right: 0.0,
                            child: Text(
                              "load image failed, click to reload",
                              textAlign: TextAlign.center,
                            ),
                          )
                        ],
                      ),
                      onTap: () {
                        state.reLoadImage();
                      },
                    );
                    break;
                }
                return Container(
                  child: Text(''),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}

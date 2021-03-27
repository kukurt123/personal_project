import 'package:flutter/material.dart';

class ProfileClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, 4 * size.height / 5);
    Offset curvePoint = Offset(size.width / 2, size.height);
    Offset endPoint = Offset(size.width, 4 * size.height / 5);
    path.quadraticBezierTo(
      curvePoint.dx,
      curvePoint.dy,
      endPoint.dx,
      endPoint.dy,
    );
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CurvedClipperTop extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    // path.moveTo(size.width * .10, 0);
    // path.quadraticBezierTo(0, 0, 0, 50);
    // path.lineTo(0, size.height);
    // path.lineTo(size.width + 20, size.height);
    // path.quadraticBezierTo(size.width, 0, size.width - 50, 0);
    // path.lineTo(size.width * .90, 0);
    path.moveTo(0, size.height);
    path.lineTo(size.width, size.height);
    // path.quadraticBezierTo(size.width, 0, size.width, 50);
    path.quadraticBezierTo(size.width + 10, 0, size.width - 40, 0);
    path.lineTo(size.width - 50, 0);
    // path.quadraticBezierTo(size.width, 0, size.width, 10);
    path.lineTo(50, 0);
    path.quadraticBezierTo(0, 0, 0, 50);

    // path.lineTo(size.width / 2, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextStyle TextStyle1(
    {double size, Color color = Colors.black, bool isBold = false}) {
  return TextStyle(
      fontSize: size,
      color: color,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
}

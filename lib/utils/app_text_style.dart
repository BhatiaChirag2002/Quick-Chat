import 'package:flutter/material.dart';

class CustomTextStyle {
  static TextStyle salsa(
      {required double fontSize, Color color = Colors.black}) {
    return TextStyle(color: color, fontSize: fontSize, fontFamily: 'Salsa');
  }

  static TextStyle itim(
      {required double fontSize, required FontWeight weight}) {
    return TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: weight,
        fontFamily: 'Itim');
  }

  static TextStyle grandstander(
      {required double fontSize, required FontWeight weight}) {
    return TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: weight,
        fontFamily: 'Grandstander');
  }
}

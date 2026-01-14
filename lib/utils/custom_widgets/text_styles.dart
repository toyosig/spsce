import 'package:flutter/material.dart';

class AppTextStyles {
  static TextStyle poppins({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    double height = 1.0,
  }) {
    return TextStyle(
      fontFamily: 'Poppins',
      color: color,
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle dmSons({
    Color? color,
    required double fontSize,
    required FontWeight fontWeight,
    double height = 1.0,
    TextDecoration? decoration,
  }) {
    return TextStyle(
      fontFamily: 'DMSans',
      decoration: decoration ?? TextDecoration.none,
      color: color,
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle rubik({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    double height = 1.0,
  }) {
    return TextStyle(
      fontFamily: 'Rubik',
      color: color,
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle leagueSpartan({
    required Color color,
    required double fontSize,
    required FontWeight fontWeight,
    double height = 1.0,
  }) {
    return TextStyle(
      fontFamily: 'LeagueSpartan',
      color: color,
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }

  static TextStyle neueMontreal({
    required Color color,
    required double fontSize,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.0,
    FontStyle fontStyle = FontStyle.normal,
  }) {
    return TextStyle(
      fontFamily: 'NeueMontreal',
      fontStyle: fontStyle,
      color: color,
      height: height,
      fontSize: fontSize,
      fontWeight: fontWeight,
    );
  }
}

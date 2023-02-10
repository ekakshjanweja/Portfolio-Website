import 'package:flutter/material.dart';

class CustomTextStyles {
  //H1 Bold

  static TextStyle h1Bold(BuildContext context, Color textColor) {
    double currentWidth = MediaQuery.of(context).size.width;
    return TextStyle(
      fontSize: currentWidth > 600
          ? currentWidth > 1000
              ? MediaQuery.of(context).size.height * 0.07
              : MediaQuery.of(context).size.height * 0.06
          : MediaQuery.of(context).size.height * 0.05,
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat-Black',
      color: textColor,
      letterSpacing: 2,
    );
  }

  //H2 Bold

  static TextStyle h2Bold(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.03,
      fontWeight: FontWeight.w900,
      color: textColor,
    );
  }

  //H2 Outline

  static TextStyle h2Outline(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.03,
      fontWeight: FontWeight.w100,
      foreground: Paint()
        ..style = PaintingStyle.stroke
        ..color = textColor
        ..strokeWidth = 0.3,
    );
  }

  //H3 Bold

  static TextStyle h3Bold(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.02,
      fontWeight: FontWeight.w900,
      fontFamily: 'Montserrat-Black',
      color: textColor,
    );
  }

  //body

  static TextStyle body(BuildContext context, Color textColor) {
    return TextStyle(
      fontSize: MediaQuery.of(context).size.height * 0.018,
      fontWeight: FontWeight.normal,
      fontFamily: 'Montserrat-Black',
      color: textColor,
    );
  }
}

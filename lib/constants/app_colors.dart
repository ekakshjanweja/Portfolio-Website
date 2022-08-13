import 'package:flutter/material.dart';

class AppColors {
  //List Of Colors

  List<Color> randomColor = [
    const Color(0xffBA36D4),
    const Color(0xffAAE500),
    const Color(0xff32B9D7),
    const Color(0xff17EAC4),
    const Color(0xffE50037),
    const Color(0xffF97E0D),
    const Color(0xffFFD600),
  ];

  //Black

  Color blackColor = const Color(0xff121212);

  Color returnRandomColor(int index) {
    return randomColor.elementAt(index);
  }
}

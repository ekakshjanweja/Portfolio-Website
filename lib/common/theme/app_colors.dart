import 'package:flutter/material.dart';

class AppColors {
  final darkBlueColor = const Color(0xff111217);
  final lightBlueColor = const Color(0xffCCD4ED);

  final containerColorHover = const Color(0xff181D35);
  final containerColorAlt = const Color(0xffE5E5E5);
  final containerColorAltHover = const Color(0xffF4F4F4);

  final Color backgroundColorDark = const Color(0xff111217);
  final Color backgroundColorLight = const Color(0xffFAFAFA);
  final Color blueColor = const Color(0xff6086FF);
  final Color primaryColor = const Color(0xff7893E8);
  final Color containerColor = const Color(0xff17191F);
  final Color containerColorLight = const Color(0xffEEF2FF);
}

final lightColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors().primaryColor,
  brightness: Brightness.light,
);

final darkColorScheme = ColorScheme.fromSeed(
  seedColor: AppColors().primaryColor,
  brightness: Brightness.dark,
  background: AppColors().backgroundColorDark,
);

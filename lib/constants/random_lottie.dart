import 'package:flutter/material.dart';

class RandomGenerator {
  //List Of Lottie Files

  // List<String> randomLottie = [
  //   'assets/lottie/color_one.json',
  //   'assets/lottie/color_two.json',
  //   'assets/lottie/color_three.json',
  //   'assets/lottie/color_four.json',
  //   'assets/lottie/color_five.json',
  //   //'assets/lottie/color_six.json',
  //   'assets/lottie/color_seven.json',
  //   'assets/lottie/color_eight.json',
  // ];

  List<String> randomLottie = [
    'https://assets8.lottiefiles.com/packages/lf20_ozpwbbmw.json',
    'https://assets9.lottiefiles.com/packages/lf20_q3vliahi.json',
    'https://assets9.lottiefiles.com/packages/lf20_piywqwyi.json',
    'https://assets4.lottiefiles.com/packages/lf20_998z8zbw.json',
    'https://assets5.lottiefiles.com/packages/lf20_irplmvv0.json',
    'https://assets1.lottiefiles.com/packages/lf20_d3hz1dyl.json',
    'https://assets5.lottiefiles.com/packages/lf20_ot4usqgt.json',
  ];

  //List Of Heights

  List<double> randomHeight = [1, 1.2, 1.4, 1.6, 1.8, 2, 2.4, 2.6];

  //List Of Light Icons

  List<String> randomLightIcon = [
    'assets/icons/light_color_one.png',
    'assets/icons/light_color_two.png',
    'assets/icons/light_color_three.png',
    'assets/icons/light_color_four.png',
    'assets/icons/light_color_five.png',
    // 'assets/icons/light_color_six.png',
    'assets/icons/light_color_seven.png',
    'assets/icons/light_color_eight.png',
  ];

  //List Of Dark Icons

  List<String> randomDarkIcon = [
    'assets/icons/dark_color_one.png',
    'assets/icons/dark_color_two.png',
    'assets/icons/dark_color_three.png',
    'assets/icons/dark_color_four.png',
    'assets/icons/dark_color_five.png',
    //'assets/icons/dark_color_six.png',
    'assets/icons/dark_color_seven.png',
    'assets/icons/dark_color_eight.png',
  ];

  String returnRandomLottie(int index) {
    return randomLottie.elementAt(index);
  }

  double returnRandomHeight(int index) {
    return randomHeight.elementAt(index);
  }

  String returnRandomLightIcon(int index) {
    return randomLightIcon.elementAt(index);
  }

  String returnRandomDarkIcon(int index) {
    return randomDarkIcon.elementAt(index);
  }
}

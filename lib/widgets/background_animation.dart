// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:portfolio_website/constants/random_lottie.dart';

class BackgroundAnimation extends StatelessWidget {
  final int randomNumber;
  final AnimationController animationController;
  const BackgroundAnimation({
    Key? key,
    required this.randomNumber,
    required this.animationController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 2,
        width: MediaQuery.of(context).size.width / 3,
        child: MouseRegion(
          onEnter: (PointerEvent event) {
            animationController.forward();
          },
          onExit: (PointerEvent event) {
            animationController.reverse();
          },
          child: Opacity(
            opacity: 0.5,
            child: Lottie.network(
              RandomGenerator().returnRandomLottie(randomNumber),
              fit: BoxFit.cover,
              controller: animationController,
            ),
          ),
        ),
      ),
    );
  }
}

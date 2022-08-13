// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import 'package:portfolio_website/constants/random_lottie.dart';
import 'package:portfolio_website/constants/strings.dart';
import 'package:portfolio_website/constants/text_styles.dart';

import 'package:portfolio_website/widgets/bg_graphic.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../widgets/background_animation.dart';

class HomePage extends StatefulWidget {
  final randomNumber;
  final randomHeight;

  const HomePage({
    Key? key,
    required this.randomNumber,
    required this.randomHeight,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  //Controllers
  late final AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool isDarkModeOn = true;

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          isDarkModeOn ? const Color(0xff121212) : Colors.grey.shade200,
      body: Stack(
        children: [
          //Logo Stormej

          Positioned(
            top: currentHeight * 0.03,
            left: currentWidth * 0.03,
            child: SvgPicture.asset(
                isDarkModeOn ? 'assets/logo.svg' : 'assets/logo_dark.svg'),
          ),

          //Lottie Animation

          Positioned(
            right: currentHeight / 10,
            top: -currentHeight /
                RandomGenerator().returnRandomHeight(widget.randomHeight),
            child: BackgroundAnimation(
              animationController: _animationController,
              randomNumber: widget.randomNumber,
            ),
          ),

          //Background Graphic

          Positioned(
            left: -currentWidth * 0.25,
            bottom: currentWidth > 600
                ? -currentHeight * 0.5
                : -currentHeight * 0.1,
            child: Opacity(
              opacity: 0.4,
              child: BackgroundGraphic(randomNumber: widget.randomNumber),
            ),
          ),

          //Text Column

          Positioned(
            top: currentHeight * 0.3,
            left:
                currentWidth > 600 ? currentWidth * 0.125 : currentWidth * 0.04,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lineOne,
                  style: CustomTextStyles.h3Bold(
                    context,
                    isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  lineTwo,
                  style: CustomTextStyles.h2Bold(
                    context,
                    isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  lineThree,
                  style: CustomTextStyles.h2Bold(
                    context,
                    isDarkModeOn ? Colors.grey.shade600 : Colors.grey.shade600,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  lineFour,
                  style: CustomTextStyles.h1Bold(
                    context,
                    isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Text(
                  lineFive,
                  style: CustomTextStyles.h2Bold(
                    context,
                    isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                Text(
                  lineSix,
                  style: CustomTextStyles.h3Bold(
                    context,
                    isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ),

          //Image Column

          Positioned(
            top: currentWidth > 600 ? currentHeight * 0.2 : currentHeight * 0.2,
            right:
                currentWidth > 600 ? currentWidth * 0.25 : currentWidth * 0.2,
            child: Column(
              children: [
                Image.asset(
                  profileImage,
                  scale: currentWidth > 1400 ? 3.5 : 8,
                ),
              ],
            ),
          ),

          //Theme Button

          Positioned(
            bottom: currentHeight * 0.01,
            right: currentWidth * 0.01,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isDarkModeOn = !isDarkModeOn;
                });
              },
              child: Image.asset(
                isDarkModeOn
                    ? RandomGenerator()
                        .returnRandomLightIcon(widget.randomNumber)
                    : RandomGenerator()
                        .returnRandomDarkIcon(widget.randomNumber),
                width: MediaQuery.of(context).size.height * 0.05,
                height: MediaQuery.of(context).size.height * 0.05,
              ),
            ),
          ),

          //Socials

          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Row(
              children: [],
            ),
          ),
        ],
      ),
    );
  }
}

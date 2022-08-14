// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';
import 'package:mailto/mailto.dart';
import 'package:portfolio_website/constants/app_colors.dart';

import 'package:portfolio_website/constants/random_lottie.dart';
import 'package:portfolio_website/constants/strings.dart';
import 'package:portfolio_website/constants/text_styles.dart';

import 'package:portfolio_website/widgets/bg_graphic.dart';
import 'package:portfolio_website/widgets/social_button.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

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
  bool buttonHover = false;

  Future<void> _launchUrl(Uri uri) async {
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $uri';
    }
  }

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var currentHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          isDarkModeOn ? const Color(0xff121212) : Colors.grey.shade200,
      body: Stack(
        children: [
          // //Blob 1

          // Positioned(
          //   right: -currentWidth * 0.2,
          //   bottom: -100,
          //   child: Image.asset(
          //     'assets/blob_one.png',
          //     scale: 4,
          //   ),
          // ),

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
                currentWidth > 600 ? currentWidth * 0.25 : currentWidth * 0.05,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Image

                Image.asset(
                  profileImage,
                  scale: currentWidth > 1400 ? 3.5 : 8,
                ),

                SizedBox(
                  height: currentHeight * 0.1,
                ),

                //Download CV

                GestureDetector(
                  onTap: () async {
                    String cv =
                        'https://drive.google.com/file/d/1aJP1HjiBOuubdRsUqyS1NNvvkJOSypk1/view?usp=sharing';
                    if (await launchUrlString(cv)) {
                    } else {
                      throw 'Could not launch $cv';
                    }
                  },
                  child: MouseRegion(
                    onEnter: (e) {
                      setState(() {
                        buttonHover = true;
                      });
                    },
                    onExit: (e) {
                      setState(() {
                        buttonHover = false;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: currentWidth * 0.15,
                      height: currentHeight * 0.1,
                      decoration: BoxDecoration(
                        color: buttonHover
                            ? AppColors().returnRandomColor(widget.randomNumber)
                            : isDarkModeOn
                                ? Colors.white
                                : Colors.black,
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.02,
                        ),
                      ),
                      child: currentWidth > 600
                          ? Text(
                              'Download CV',
                              style: CustomTextStyles.h3Bold(
                                context,
                                isDarkModeOn ? Colors.black : Colors.white,
                              ),
                            )
                          : Icon(
                              Icons.download,
                              color: isDarkModeOn ? Colors.white : Colors.black,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //Theme Button

          Positioned(
            top: currentHeight * 0.03,
            right: currentWidth * 0.03,
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
            bottom: currentHeight * 0.03,
            child: SizedBox(
              width: currentWidth,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //GitHub

                  SocialButton(
                    icon: 'assets/socials/Github.svg',
                    url: urls[0],
                    randomNumber: widget.randomNumber,
                    randomHeight: widget.randomHeight,
                    iconColor: isDarkModeOn ? Colors.white : Colors.black,
                  ),

                  //Twitter

                  SocialButton(
                    icon: 'assets/socials/Twitter.svg',
                    url: urls[2],
                    randomNumber: widget.randomNumber,
                    randomHeight: widget.randomHeight,
                    iconColor: isDarkModeOn ? Colors.white : Colors.black,
                  ),

                  //LinkedIn

                  SocialButton(
                    icon: 'assets/socials/LinkedIN.svg',
                    url: urls[1],
                    randomNumber: widget.randomNumber,
                    randomHeight: widget.randomHeight,
                    iconColor: isDarkModeOn ? Colors.white : Colors.black,
                  ),

                  //Behance

                  SocialButton(
                    icon: 'assets/socials/Behance.svg',
                    url: urls[3],
                    randomNumber: widget.randomNumber,
                    randomHeight: widget.randomHeight,
                    iconColor: isDarkModeOn ? Colors.white : Colors.black,
                  ),

                  //Mail

                  SocialButton(
                    icon: 'assets/socials/Mail.svg',
                    url: urls[4],
                    randomNumber: widget.randomNumber,
                    randomHeight: widget.randomHeight,
                    iconColor: isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

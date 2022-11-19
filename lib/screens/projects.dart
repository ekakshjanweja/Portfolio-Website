import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/constants/random_lottie.dart';

class Projects extends StatefulWidget {
  final randomNumber;
  final randomHeight;
  const Projects({
    super.key,
    required this.randomNumber,
    required this.randomHeight,
  });

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
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

          //Not Whatsapp

          Positioned(
            top: currentHeight * 0.2,
            left: currentWidth * 0.1,
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                  color: AppColors().returnRandomColor(widget.randomNumber)),
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
        ],
      ),
    );
  }
}

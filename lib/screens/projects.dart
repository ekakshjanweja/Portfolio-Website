import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/constants/random_lottie.dart';
import 'package:portfolio_website/screens/home_page.dart';
import 'package:portfolio_website/widgets/background_animation.dart';
import 'package:portfolio_website/widgets/bg_graphic.dart';
import 'package:portfolio_website/widgets/project_widget.dart';

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
      backgroundColor: isDarkModeOn ? Colors.black : Colors.white,
      body: Stack(
        children: [
          //Logo Stormej

          Positioned(
            top: currentHeight * 0.03,
            left: currentWidth * 0.03,
            child: GestureDetector(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    randomNumber: widget.randomNumber,
                    randomHeight: widget.randomHeight,
                  ),
                ),
              ),
              child: SvgPicture.asset(
                  isDarkModeOn ? 'assets/logo.svg' : 'assets/logo_dark.svg'),
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

          //Project Row

          Positioned(
            top: currentHeight * 0.2,
            left: currentWidth * 0.02,
            right: currentWidth * 0.02,
            bottom: currentHeight * 0.01,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Project 1

                  Project(
                    isDarkModeOn: isDarkModeOn,
                    randomHeight: widget.randomHeight,
                    randomNumber: widget.randomNumber,
                    title: 'Google Docs Clone',
                    desc:
                        'Introducing "DocuDoodle", a clone of Google Docs built with Flutter, Node.js, MongoDB, Express, and Socket.io. DocuDoodle offers real-time collaboration, fast performance, and an intuitive design similar to Google Docs.',
                    techStack:
                        'Flutter - Riverpod - NodeJs - Express - MongoDB - SocketIO',
                    url: 'https://github.com/ekakshjanweja/Google-Docs-Clone',
                  ),

                  //Project 2

                  Project(
                    isDarkModeOn: isDarkModeOn,
                    randomHeight: widget.randomHeight,
                    randomNumber: widget.randomNumber,
                    title: 'NotWhatsapp',
                    desc:
                        'Introducing "NotWhatsApp", a clone of the popular instant messaging app, WhatsApp. Built with Flutter and Firebase, NotWhatsApp offers features such as Group Chat, GIF Support, Video Call, Emoji and Image Support, Status, and State Management using Riverpod.',
                    techStack: 'Flutter - Riverpod - Firebase - GIPHY - Agora',
                    url: 'https://github.com/ekakshjanweja/NotWhatsapp',
                  ),

                  //Project 3

                  Project(
                    isDarkModeOn: isDarkModeOn,
                    randomHeight: widget.randomHeight,
                    randomNumber: widget.randomNumber,
                    title: 'Personal Portfolio Website',
                    desc: 'You are already hear.',
                    techStack: 'Flutter - Provider - Lottie Files',
                    url: 'https://github.com/ekakshjanweja/Portfolio-Website',
                  ),
                ],
              ),
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

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../constants/strings.dart';

class SocialButton extends StatefulWidget {
  final randomNumber;
  final randomHeight;
  final iconColor;
  final String url;
  final String icon;
  SocialButton({
    Key? key,
    required this.randomNumber,
    required this.randomHeight,
    required this.iconColor,
    required this.icon,
    required this.url,
  }) : super(key: key);

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool isHoverting = false;
  @override
  Widget build(BuildContext context) {
    double currentHeight = MediaQuery.of(context).size.height;
    double currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: currentWidth * 0.0),
      child: MouseRegion(
        onEnter: (e) {
          setState(() {
            isHoverting = true;
          });
        },
        onExit: (e) {
          setState(() {
            isHoverting = false;
          });
        },
        child: GestureDetector(
          onTap: () async {
            if (await launchUrlString(widget.url)) {
            } else {
              throw 'Could not launch ${widget.url}';
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(
              widget.icon,
              height:
                  isHoverting ? currentHeight * 0.055 : currentHeight * 0.05,
              color: isHoverting
                  ? AppColors()
                      .returnRandomColor(widget.randomNumber)
                      .withOpacity(1)
                  : widget.iconColor,
            ),
          ),
        ),
      ),
    );
  }
}

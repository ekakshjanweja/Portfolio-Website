import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio_website/constants/app_colors.dart';

import '../constants/random_lottie.dart';

class BackgroundGraphic extends StatefulWidget {
  const BackgroundGraphic({
    Key? key,
    required this.randomNumber,
  }) : super(key: key);

  final int randomNumber;

  @override
  State<BackgroundGraphic> createState() => _BackgroundGraphicState();
}

class _BackgroundGraphicState extends State<BackgroundGraphic> {
  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/tri.svg',
      width: MediaQuery.of(context).size.width * 0.55,
      color: AppColors().returnRandomColor(widget.randomNumber),
    );
  }
}

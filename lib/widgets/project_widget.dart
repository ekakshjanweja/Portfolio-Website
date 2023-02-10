import 'package:flutter/material.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/constants/text_styles.dart';
import 'package:url_launcher/url_launcher_string.dart';

class Project extends StatelessWidget {
  final randomNumber;
  final randomHeight;
  final isDarkModeOn;
  final String title;
  final String url;
  final String desc;
  final String techStack;

  const Project({
    super.key,
    required this.randomHeight,
    required this.randomNumber,
    required this.isDarkModeOn,
    required this.title,
    required this.url,
    required this.desc,
    required this.techStack,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      margin: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
      ),
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.height * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.02,
      ),
      decoration: BoxDecoration(
        color: AppColors().returnRandomColor(randomNumber).withOpacity(0.3),
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.02,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: CustomTextStyles.h2Bold(
              context,
              isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Description

              //Line 1

              Text(
                desc,
                style: CustomTextStyles.body(
                  context,
                  isDarkModeOn ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          //Tech Stack

          Text(
            'Tech Stack',
            style: CustomTextStyles.h3Bold(
              context,
              isDarkModeOn ? Colors.white : Colors.black,
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),

          Text(
            techStack,
            style: CustomTextStyles.body(
              context,
              isDarkModeOn ? Colors.white : Colors.black,
            ).copyWith(fontWeight: FontWeight.bold),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () async {
                  String cv = url;
                  if (await launchUrlString(cv)) {
                  } else {
                    throw 'Could not launch $cv';
                  }
                },
                child: Text(
                  'Github',
                  style: CustomTextStyles.h3Bold(
                    context,
                    isDarkModeOn ? Colors.white : Colors.black,
                  ),
                ),
              ),
              // const SizedBox(height: 40),
              // Text(
              //   'Youtube',
              //   style: CustomTextStyles.h3Bold(
              //     context,
              //     isDarkModeOn ? Colors.white : Colors.black,
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}

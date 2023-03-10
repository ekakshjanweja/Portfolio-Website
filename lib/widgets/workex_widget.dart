import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class WorkexWidget extends ConsumerStatefulWidget {
  const WorkexWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WorkexWidgetState();
}

class _WorkexWidgetState extends ConsumerState<WorkexWidget> {
  bool isTbb = false;
  bool isZupay = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Work Experience',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: theme == ThemeMode.dark
                    ? AppColors().lightBlueColor.withOpacity(0.9)
                    : AppColors().darkBlueColor.withOpacity(0.9),
              ),
        ),

        SizedBox(
          height: currentWidth * 0.02,
        ),

        //Team Black Box

        MouseRegion(
          onEnter: (event) => setState(() {
            isTbb = true;
          }),
          onExit: (event) => setState(() {
            isTbb = false;
          }),
          child: Container(
            width: currentWidth,
            decoration: BoxDecoration(
              color: theme == ThemeMode.dark
                  ? isTbb
                      ? AppColors().containerColorHover
                      : AppColors().containerColor
                  : isTbb
                      ? AppColors().containerColorAltHover
                      : AppColors().containerColorAlt,
              borderRadius: BorderRadius.circular(currentWidth * 0.01),
            ),
            padding: EdgeInsets.symmetric(
              vertical: currentHeight * 0.02,
              horizontal: currentWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Headline

                currentWidth > 1000
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Team Black Box',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                          Text(
                            'Jan’23 - Present',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Team Black Box',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                          Text(
                            'Jan’23 - Present',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                        ],
                      ),

                //Title

                SizedBox(
                  height: currentHeight * 0.05,
                ),

                Text(
                  'Full Stack Intern [Part Time]',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                //Body 1

                SizedBox(
                  height: currentHeight * 0.025,
                ),

                Text(
                  'Team Black Box was created to build amazing products (software and hardware), open source code and content. We call it "Building the Amaze". ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                //Project 1

                SizedBox(
                  height: currentHeight * 0.05,
                ),

                Text(
                  'Take-A-Sip',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                //TAS Description

                SizedBox(
                  height: currentHeight * 0.025,
                ),

                Text(
                  'Take a Sip is an easy to use, and beautiful app to help you keep yourself hydrated. Take a Sip reminds you to drink water and allows you to track your approximate daily water intake.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                SizedBox(
                  height: currentHeight * 0.01,
                ),

                Text(
                  '-> Implemented customizable SIP units with volume and image options using React Native.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                //I Wont For

                SizedBox(
                  height: currentHeight * 0.05,
                ),

                Text(
                  'I won\'t forget',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                SizedBox(
                  height: currentHeight * 0.025,
                ),

                Text(
                  'A simple reminders app which is yet to go live :)',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                SizedBox(
                  height: currentHeight * 0.01,
                ),

                Text(
                  '-> Performed nlp on the input text using compromise.cool to extract various parameters from reminder text.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),
              ],
            ),
          ),
        ),

        //Zupay

        SizedBox(
          height: currentWidth * 0.02,
        ),

        MouseRegion(
          onEnter: (event) => setState(() {
            isZupay = true;
          }),
          onExit: (event) => setState(() {
            isZupay = false;
          }),
          child: Container(
            width: currentWidth,
            decoration: BoxDecoration(
              color: theme == ThemeMode.dark
                  ? isZupay
                      ? AppColors().containerColorHover
                      : AppColors().containerColor
                  : isZupay
                      ? AppColors().containerColorAltHover
                      : AppColors().containerColorAlt,
              borderRadius: BorderRadius.circular(currentWidth * 0.01),
            ),
            padding: EdgeInsets.symmetric(
              vertical: currentHeight * 0.02,
              horizontal: currentWidth * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Headline

                currentWidth > 1000
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Zupay',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                          Text(
                            'OCT’21 - Jan’22',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Zupay',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                          Text(
                            'OCT’21 - Jan’22',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  fontWeight: FontWeight.w600,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.8)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.8),
                                ),
                          ),
                        ],
                      ),

                //Title

                SizedBox(
                  height: currentHeight * 0.05,
                ),

                Text(
                  'Flutter Development Intern [Full Time]',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                //Body 1

                SizedBox(
                  height: currentHeight * 0.025,
                ),

                Text(
                  'Join 100,000+ teens globally to build habits on picking stocks, growing wealth & more through games, live activities with a global community.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),

                SizedBox(
                  height: currentHeight * 0.025,
                ),

                Text(
                  '-> Developed multiple screens using flutter as the framework.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),
                Text(
                  '->Implemented dark mode for the initial versions of the application.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),
                Text(
                  '->Used riverpod package for state management of the application.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),
                Text(
                  '->Used dio package for GET and POST requests that were to be made to and from the internal API.',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.9)
                            : AppColors().darkBlueColor.withOpacity(0.9),
                      ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

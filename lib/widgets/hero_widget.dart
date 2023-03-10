import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class HeroWidget extends ConsumerStatefulWidget {
  const HeroWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends ConsumerState<HeroWidget> {
  bool resumeHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return currentWidth > 1400
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //Image

              Padding(
                padding: EdgeInsets.all(currentWidth * 0.02),
                child: Image.asset(
                  'assets/profile.png',
                  scale: 10,
                ),
              ),

              //Text Section

              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Intro Text

                    RichText(
                      text: TextSpan(
                        text: 'Hey, I\'m',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                              fontWeight: FontWeight.bold,
                              color: theme == ThemeMode.dark
                                  ? AppColors().lightBlueColor.withOpacity(0.6)
                                  : AppColors().darkBlueColor.withOpacity(0.6),
                            ),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' Ekaksh Janweja ',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme == ThemeMode.dark
                                      ? AppColors().lightBlueColor
                                      : AppColors().darkBlueColor,
                                ),
                          ),
                          TextSpan(
                            text: '. I\'m a Flutter Developer & UX Designer.',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: theme == ThemeMode.dark
                                      ? AppColors()
                                          .lightBlueColor
                                          .withOpacity(0.6)
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.6),
                                ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(
                      height: currentHeight * 0.02,
                    ),

                    //Resume Button

                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (e) {
                        setState(() {
                          resumeHover = true;
                        });
                      },
                      onExit: (e) {
                        setState(() {
                          resumeHover = false;
                        });
                      },
                      child: Text(
                        'Download Resume',
                        style:
                            Theme.of(context).textTheme.headlineSmall!.copyWith(
                                  color: resumeHover
                                      ? AppColors().blueColor
                                      : theme == ThemeMode.dark
                                          ? AppColors().lightBlueColor
                                          : AppColors()
                                              .darkBlueColor
                                              .withOpacity(0.6)
                                              .withOpacity(0.6),
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //Image

              Padding(
                padding: EdgeInsets.all(currentWidth * 0.02),
                child: Image.asset(
                  'assets/profile.png',
                  scale: 10,
                ),
              ),

              //Text Section

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Intro Text

                  RichText(
                    text: TextSpan(
                      text: 'Hey, I\'m',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme == ThemeMode.dark
                                ? AppColors().lightBlueColor.withOpacity(0.6)
                                : AppColors().darkBlueColor.withOpacity(0.6),
                          ),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Ekaksh Janweja ',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme == ThemeMode.dark
                                    ? AppColors().lightBlueColor
                                    : AppColors().darkBlueColor,
                              ),
                        ),
                        TextSpan(
                          text: '. I\'m a Flutter Developer & UX Designer.',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.bold,
                                color: theme == ThemeMode.dark
                                    ? AppColors()
                                        .lightBlueColor
                                        .withOpacity(0.6)
                                    : AppColors()
                                        .darkBlueColor
                                        .withOpacity(0.6),
                              ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: currentHeight * 0.02,
                  ),

                  //Resume Button

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (e) {
                      setState(() {
                        resumeHover = true;
                      });
                    },
                    onExit: (e) {
                      setState(() {
                        resumeHover = false;
                      });
                    },
                    child: Text(
                      'Download Resume',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: resumeHover
                                    ? AppColors().blueColor
                                    : theme == ThemeMode.dark
                                        ? AppColors()
                                            .lightBlueColor
                                            .withOpacity(0.6)
                                        : AppColors()
                                            .darkBlueColor
                                            .withOpacity(0.6),
                                fontWeight: FontWeight.bold,
                              ),
                    ),
                  ),
                ],
              ),
            ],
          );
  }
}

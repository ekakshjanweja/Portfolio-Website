import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/widgets/icons/icon_widget.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HeroLarge extends ConsumerStatefulWidget {
  const HeroLarge({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HeroLargeState();
}

class _HeroLargeState extends ConsumerState<HeroLarge> {
  bool resumeHover = false;
  bool nameHover = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    //Social Icons

    final List<IconWidget> socialIcons = [
      IconWidget(
        icon: Assets.logos.twitter,
        title: 'Twitter',
        url: Strings.twitter,
      ),
      IconWidget(
        icon: Assets.logos.linkedin,
        title: 'Linkedin',
        url: Strings.linkedin,
      ),
      IconWidget(
        icon: theme == ThemeMode.dark
            ? Assets.logos.githubWhite
            : Assets.logos.githubBlack,
        title: 'Github',
        url: Strings.github,
      ),
      IconWidget(
        icon: Assets.logos.hashnode,
        title: 'Hashnode',
        url: Strings.hashnode,
      ),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //Image

        Image.asset(
          Assets.profile.path,
          scale: 12,
        ),

        const SizedBox(width: 20),

        //Text Section

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Intro Text

              RichText(
                text: TextSpan(
                  text: 'Hey, I\'m',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: Dimensions.mediumTextSize,
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor.withOpacity(0.6)
                            : AppColors().darkBlueColor.withOpacity(0.6),
                      ),
                  children: [
                    TextSpan(
                      mouseCursor: SystemMouseCursors.click,
                      onEnter: (event) => setState(() {
                        nameHover = true;
                      }),
                      onExit: (event) => setState(() {
                        nameHover = false;
                      }),
                      recognizer: TapGestureRecognizer()..onTap = () {},
                      text: ' Ekaksh Janweja. ',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: nameHover
                                    ? AppColors().blueColor
                                    : theme == ThemeMode.dark
                                        ? AppColors().lightBlueColor
                                        : AppColors().darkBlueColor,
                              ),
                    ),
                    TextSpan(
                      text: 'I\'m a Full Stack Mobile Developer & UX Designer.',
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(
                            fontSize: Dimensions.mediumTextSize,
                            color: theme == ThemeMode.dark
                                ? AppColors().lightBlueColor.withOpacity(0.6)
                                : AppColors().darkBlueColor.withOpacity(0.6),
                          ),
                    ),
                  ],
                ),
              ),

              //Bottom Row

              const SizedBox(height: 20),

              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
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
                    child: GestureDetector(
                      onTap: () async {
                        LaunchUrl().launchUrl(Strings.cv);
                      },
                      child: Text(
                        'Download Resume'.toUpperCase(),
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              fontSize: Dimensions.smallerTextSize,
                              color: resumeHover
                                  ? AppColors().blueColor
                                  : theme == ThemeMode.dark
                                      ? AppColors().lightBlueColor
                                      : AppColors()
                                          .darkBlueColor
                                          .withOpacity(0.6)
                                          .withOpacity(0.6),
                            ),
                      ),
                    ),
                  ),

                  //Socials

                  SizedBox(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.max,
                        children: socialIcons,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

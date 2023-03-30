import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/common/widgets/icons/icon_widget.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class BottomBar extends ConsumerStatefulWidget {
  const BottomBar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BottomBarState();
}

class _BottomBarState extends ConsumerState<BottomBar> {
  bool isLogo = false;

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
      IconWidget(
        icon: Assets.logos.insta,
        title: 'Instagram',
        url: Strings.insta,
      ),
    ];

    return Container(
      padding: const EdgeInsets.only(
        bottom: 30,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 300,
        children: [
          //Logo

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (event) => setState(() {
                isLogo = true;
              }),
              onExit: (event) => setState(() {
                isLogo = false;
              }),
              child: GestureDetector(
                onTap: () => Navigator.of(context).canPop(),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: SvgPicture.asset(
                    color: isLogo ? AppColors().blueColor : null,
                    theme == ThemeMode.dark
                        ? Assets.logoLight
                        : Assets.logoDark,
                    height: Dimensions.smallTextSize,
                  ),
                ),
              ),
            ),
          ),

          // Socials

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: SizedBox(
              width: 300,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: socialIcons,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

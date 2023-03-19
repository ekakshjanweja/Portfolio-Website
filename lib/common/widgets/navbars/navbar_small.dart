import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/widgets/menu/menu_page.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

class NavbarSmall extends ConsumerStatefulWidget {
  final bool isMobile;
  const NavbarSmall({
    super.key,
    required this.isMobile,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarSmallState();
}

class _NavbarSmallState extends ConsumerState<NavbarSmall> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return MediaQuery.of(context).size.width < 320
        ? Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Logo

                GestureDetector(
                  onTap: () => Navigator.of(context).canPop(),
                  child: SvgPicture.asset(
                    theme == ThemeMode.dark
                        ? Assets.logoLight
                        : Assets.logoDark,
                    height: Dimensions.mediumTextSize,
                  ),
                ),

                //Sub Row

                Column(
                  children: [
                    //Menu

                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: MenuPage(isMobile: widget.isMobile),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.menu,
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor
                            : AppColors().darkBlueColor,
                        size: Dimensions.mediumTextSize,
                      ),
                    ),

                    const SizedBox(width: 10),

                    //Theme Switcher

                    GestureDetector(
                      onTap: () {
                        ref.read(themeProvider.notifier).state =
                            theme == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                      },
                      child: SvgPicture.asset(
                        theme == ThemeMode.dark
                            ? Assets.iconLight
                            : Assets.iconDark,
                        height: Dimensions.mediumTextSize,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Logo

                GestureDetector(
                  onTap: () => Navigator.of(context).canPop(),
                  child: SvgPicture.asset(
                    theme == ThemeMode.dark
                        ? Assets.logoLight
                        : Assets.logoDark,
                    height: Dimensions.mediumTextSize,
                  ),
                ),

                //Sub Row

                Row(
                  children: [
                    //Menu

                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.topToBottom,
                            child: MenuPage(isMobile: widget.isMobile),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.menu,
                        color: theme == ThemeMode.dark
                            ? AppColors().lightBlueColor
                            : AppColors().darkBlueColor,
                        size: Dimensions.mediumTextSize,
                      ),
                    ),

                    const SizedBox(width: 10),

                    //Theme Switcher

                    GestureDetector(
                      onTap: () {
                        ref.read(themeProvider.notifier).state =
                            theme == ThemeMode.light
                                ? ThemeMode.dark
                                : ThemeMode.light;
                      },
                      child: SvgPicture.asset(
                        theme == ThemeMode.dark
                            ? Assets.iconLight
                            : Assets.iconDark,
                        height: Dimensions.mediumTextSize,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
  }
}

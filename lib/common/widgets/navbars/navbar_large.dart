import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

class NavbarLarge extends ConsumerStatefulWidget {
  const NavbarLarge({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarLargeState();
}

class _NavbarLargeState extends ConsumerState<NavbarLarge> {
  bool isAbout = false;
  bool isBlogs = false;
  bool isThemeSwitcher = false;
  bool isLogo = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Padding(
      padding: const EdgeInsets.only(
        top: 30,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //Logo

          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => setState(() {
              isLogo = true;
            }),
            onExit: (event) => setState(() {
              isLogo = false;
            }),
            child: GestureDetector(
              onTap: () => Navigator.of(context).canPop(),
              child: SvgPicture.asset(
                color: isLogo ? AppColors().blueColor : null,
                theme == ThemeMode.dark ? Assets.logoLight : Assets.logoDark,
                height: Dimensions.smallTextSize,
              ),
            ),
          ),

          //Sub Row

          Row(
            children: [
              //About

              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) => setState(() {
                  isAbout = true;
                }),
                onExit: (event) => setState(() {
                  isAbout = false;
                }),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      )),
                  child: Text(
                    'About',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: Dimensions.smallTextSize,
                          color: isAbout
                              ? AppColors().blueColor
                              : theme == ThemeMode.dark
                                  ? AppColors().lightBlueColor
                                  : AppColors().darkBlueColor,
                        ),
                  ),
                ),
              ),

              //Blogs

              const SizedBox(width: 20),

              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) => setState(() {
                  isBlogs = true;
                }),
                onExit: (event) => setState(() {
                  isBlogs = false;
                }),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(),
                      )),
                  child: Text(
                    'Blogs',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: Dimensions.smallTextSize,
                          color: isBlogs
                              ? AppColors().blueColor
                              : theme == ThemeMode.dark
                                  ? AppColors().lightBlueColor
                                  : AppColors().darkBlueColor,
                        ),
                  ),
                ),
              ),

              const SizedBox(width: 20),

              //Theme Switcher

              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) => setState(() {
                  isThemeSwitcher = true;
                }),
                onExit: (event) => setState(() {
                  isThemeSwitcher = false;
                }),
                child: GestureDetector(
                  onTap: () {
                    ref.read(themeProvider.notifier).state =
                        theme == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  },
                  child: SvgPicture.asset(
                    color: isThemeSwitcher ? AppColors().blueColor : null,
                    theme == ThemeMode.dark
                        ? Assets.iconLight
                        : Assets.iconDark,
                    height: Dimensions.smallTextSize,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

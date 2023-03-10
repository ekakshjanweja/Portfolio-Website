import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/screens/about_page.dart';
import 'package:portfolio_website/screens/blog_page.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class DesktopNavbar extends ConsumerStatefulWidget {
  const DesktopNavbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DesktopNavbarState();
}

class _DesktopNavbarState extends ConsumerState<DesktopNavbar> {
  bool isAbout = false;
  bool isBlogs = false;
  bool isThemeSwitcher = false;
  bool isLogo = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: currentHeight * 0.02,
      ),
      child: Row(
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
                height: currentWidth * 0.01944,
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
                        builder: (context) => const AboutPage(),
                      )),
                  child: Text(
                    'About',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: currentWidth * 0.01944,
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
                        builder: (context) => const BlogPage(),
                      )),
                  child: Text(
                    'Blogs',
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: currentWidth * 0.01944,
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
                    height: currentWidth * 0.01944,
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

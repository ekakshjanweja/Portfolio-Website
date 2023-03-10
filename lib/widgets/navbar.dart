import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/screens/about_page.dart';
import 'package:portfolio_website/screens/blog_page.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class Navbar extends ConsumerStatefulWidget {
  const Navbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NavbarState();
}

class _NavbarState extends ConsumerState<Navbar> {
  bool isAbout = false;
  bool isBlogs = false;
  bool isMenu = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = ref.watch(themeProvider);
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;
    if (currentWidth > 1000) {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: currentHeight * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () => Navigator.of(context).canPop(),
              child: SvgPicture.asset(
                theme == ThemeMode.dark
                    ? 'assets/logo_light.svg'
                    : 'assets/logo_dark.svg',
                height: currentWidth * 0.025,
              ),
            ),

            //Pages

            Row(
              children: [
                MouseRegion(
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
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: isAbout
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
                const SizedBox(width: 20),
                MouseRegion(
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
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: isBlogs
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
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ref.read(themeProvider.notifier).state =
                        theme == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  },
                  child: SvgPicture.asset(
                    theme == ThemeMode.dark
                        ? 'assets/icon_light.svg'
                        : 'assets/icon_dark.svg',
                    height: currentWidth * 0.025,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    } else {
      return Padding(
        padding: EdgeInsets.symmetric(
          vertical: currentHeight * 0.02,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SvgPicture.asset(
              theme == ThemeMode.dark
                  ? 'assets/logo_light.svg'
                  : 'assets/logo_dark.svg',
              height: currentWidth * 0.04,
            ),
            Row(
              children: [
                MouseRegion(
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
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: currentWidth * 0.04,
                                color: isAbout
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
                const SizedBox(width: 20),
                MouseRegion(
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
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: currentWidth * 0.04,
                                color: isBlogs
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
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () {
                    ref.read(themeProvider.notifier).state =
                        theme == ThemeMode.light
                            ? ThemeMode.dark
                            : ThemeMode.light;
                  },
                  child: SvgPicture.asset(
                    theme == ThemeMode.dark
                        ? 'assets/icon_light.svg'
                        : 'assets/icon_dark.svg',
                    height: currentWidth * 0.04,
                  ),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }
}

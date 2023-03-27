import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/pages/about/about_page.dart';
import 'package:portfolio_website/common/pages/blogs/blogs_page.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

class MenuPage extends ConsumerStatefulWidget {
  final bool isMobile;
  const MenuPage({
    super.key,
    required this.isMobile,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MenuPageState();
}

class _MenuPageState extends ConsumerState<MenuPage> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: !widget.isMobile ? 500 : null,
          padding: const EdgeInsets.symmetric(
            vertical: 30,
            horizontal: 40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //Top Row

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  //Close Menu

                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.close,
                      color: theme == ThemeMode.dark
                          ? AppColors().lightBlueColor
                          : AppColors().darkBlueColor,
                      size: Dimensions.mediumTextSize,
                    ),
                  ),

                  const SizedBox(width: 20),

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
              ),

              const SizedBox(
                height: 60,
              ),

              //Pages

              Column(
                children: [
                  //About

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.topToBottom,
                      child: const AboutPage(),
                    )),
                    child: Text(
                      'About'.toUpperCase(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.mediumTextSize,
                                color: theme == ThemeMode.dark
                                    ? AppColors().lightBlueColor
                                    : AppColors().darkBlueColor,
                              ),
                    ),
                  ),

                  //Blogs

                  const SizedBox(
                    height: 40,
                  ),

                  GestureDetector(
                    onTap: () => Navigator.of(context).push(PageTransition(
                      type: PageTransitionType.topToBottom,
                      child: const BlogsPage(),
                    )),
                    child: Text(
                      'Blogs'.toUpperCase(),
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: Dimensions.mediumTextSize,
                                color: theme == ThemeMode.dark
                                    ? AppColors().lightBlueColor
                                    : AppColors().darkBlueColor,
                              ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

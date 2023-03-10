import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class TabletMenuPage extends ConsumerStatefulWidget {
  const TabletMenuPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabletMenuPageState();
}

class _TabletMenuPageState extends ConsumerState<TabletMenuPage> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(
            horizontal: currentWidth * 0.2,
            vertical: currentHeight * 0.02,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      size: currentWidth * 0.04,
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
                      height: currentWidth * 0.04,
                    ),
                  ),
                ],
              ),

              //Pages

              Column(
                children: [
                  //About

                  Text(
                    'About'.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: currentWidth * 0.04,
                          color: theme == ThemeMode.dark
                              ? AppColors().lightBlueColor
                              : AppColors().darkBlueColor,
                        ),
                  ),

                  //Blogs

                  const SizedBox(
                    height: 40,
                  ),

                  Text(
                    'Blogs'.toUpperCase(),
                    style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: currentWidth * 0.04,
                          color: theme == ThemeMode.dark
                              ? AppColors().lightBlueColor
                              : AppColors().darkBlueColor,
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

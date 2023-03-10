import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/layouts/tablet/screens/tablet_menu_page.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class TabletNavbar extends ConsumerStatefulWidget {
  const TabletNavbar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TabletNavbarState();
}

class _TabletNavbarState extends ConsumerState<TabletNavbar> {
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

          GestureDetector(
            onTap: () => Navigator.of(context).canPop(),
            child: SvgPicture.asset(
              theme == ThemeMode.dark ? Assets.logoLight : Assets.logoDark,
              height: currentWidth * 0.04,
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
                    MaterialPageRoute(
                      builder: (context) => const TabletMenuPage(),
                    ),
                  );
                },
                icon: Icon(
                  Icons.menu,
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
                  theme == ThemeMode.dark ? Assets.iconLight : Assets.iconDark,
                  height: currentWidth * 0.04,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

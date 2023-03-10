import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/main.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';
import 'package:portfolio_website/widgets/hero_widget.dart';
import 'package:portfolio_website/widgets/navbar.dart';
import 'package:portfolio_website/widgets/skills_widget.dart';
import 'package:portfolio_website/widgets/social_icon.dart';
import 'package:portfolio_website/widgets/social_section.dart';
import 'package:portfolio_website/widgets/workex_widget.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  bool resumeHover = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final currentHeight = MediaQuery.of(context).size.height;
    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: theme == ThemeMode.dark
          ? AppColors().darkBlueColor
          : Colors.grey.shade200,
      body: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.symmetric(
          horizontal:
              currentWidth > 800 ? currentWidth * 0.25 : currentWidth * 0.2,
        ),
        child: ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //Navbar

                const Navbar(),

                //Hero

                SizedBox(
                  height: currentHeight * 0.07,
                ),

                const HeroWidget(),

                //Socials

                SizedBox(
                  height: currentHeight * 0.1,
                ),

                const SocialSection(),

                //Work Experience

                SizedBox(
                  height: currentHeight * 0.1,
                ),

                // const WorkexWidget(),

                const Skills(),

                //Bottom Sized Box

                SizedBox(
                  height: currentHeight * 0.1,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

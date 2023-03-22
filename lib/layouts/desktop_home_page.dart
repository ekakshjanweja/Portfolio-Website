import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/widgets/heros/hero_large.dart';
import 'package:portfolio_website/common/widgets/navbars/bottom_bar.dart';
import 'package:portfolio_website/common/widgets/navbars/navbar_large.dart';
import 'package:portfolio_website/common/widgets/projects/projects_section.dart';
import 'package:portfolio_website/common/widgets/skills/skills_large.dart';
import 'package:portfolio_website/common/widgets/workex/work_ex_section.dart';

class DesktopHomePage extends ConsumerWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          width: 800,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: const [
                  //Navbar

                  NavbarLarge(),

                  SizedBox(
                    height: 80,
                  ),

                  //Hero

                  HeroLarge(),

                  SizedBox(
                    height: 80,
                  ),

                  //Skills

                  SkillsLarge(),

                  SizedBox(
                    height: 80,
                  ),

                  //Work Experience

                  WorkEx(),

                  SizedBox(
                    height: 80,
                  ),

                  //Projects

                  ProjectsSection(),

                  SizedBox(
                    height: 80,
                  ),

                  //Bottom Bar

                  BottomBar()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

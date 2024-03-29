import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/widgets/blog/blog_mini.dart';
import 'package:portfolio_website/common/widgets/heros/hero_small.dart';
import 'package:portfolio_website/common/widgets/navbars/bottom_bar.dart';
import 'package:portfolio_website/common/widgets/navbars/navbar_small.dart';
import 'package:portfolio_website/common/widgets/projects/projects_section.dart';
import 'package:portfolio_website/common/widgets/skills/skills_large.dart';
import 'package:portfolio_website/common/widgets/workex/work_ex_section.dart';

class MobileHomePage extends ConsumerWidget {
  const MobileHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: const SingleChildScrollView(
                child: Column(
                  children: [
                    //Navbar

                    NavbarSmall(isMobile: true),

                    SizedBox(height: 30),

                    //Mobile Hero

                    HeroSmall(),

                    SizedBox(
                      height: 30,
                    ),

                    //Blogs

                    BlogMini(),

                    SizedBox(
                      height: 30,
                    ),

                    //Skills

                    SkillsLarge(),

                    SizedBox(
                      height: 30,
                    ),

                    WorkEx(),

                    SizedBox(
                      height: 30,
                    ),

                    ProjectsSection(),

                    SizedBox(
                      height: 60,
                    ),

                    BottomBar(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

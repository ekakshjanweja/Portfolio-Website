import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/widgets/blog/blog_mini.dart';
import 'package:portfolio_website/common/widgets/heros/hero_small.dart';
import 'package:portfolio_website/common/widgets/navbars/bottom_bar.dart';
import 'package:portfolio_website/common/widgets/navbars/navbar_large.dart';
import 'package:portfolio_website/common/widgets/navbars/navbar_small.dart';
import 'package:portfolio_website/common/widgets/projects/projects_section.dart';
import 'package:portfolio_website/common/widgets/skills/skills_large.dart';
import 'package:portfolio_website/common/widgets/workex/work_ex_section.dart';

class TabletHomePage extends ConsumerWidget {
  const TabletHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            width: 500,
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    //Navbar

                    currentWidth > 700
                        ? const NavbarLarge()
                        : const NavbarSmall(
                            isMobile: false,
                          ),

                    const SizedBox(
                      height: 60,
                    ),

                    //Hero

                    const HeroSmall(),

                    const SizedBox(
                      height: 60,
                    ),

                    //Blogs

                    const BlogMini(),

                    const SizedBox(
                      height: 60,
                    ),

                    //Skills

                    const SkillsLarge(),

                    //Work Experience

                    const SizedBox(
                      height: 60,
                    ),

                    const WorkEx(),

                    //Projects

                    const SizedBox(
                      height: 30,
                    ),

                    const ProjectsSection(),

                    const SizedBox(
                      height: 30,
                    ),

                    const BottomBar(),
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

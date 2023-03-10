import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';
import 'package:portfolio_website/widgets/social_icon.dart';

class Skills extends ConsumerStatefulWidget {
  const Skills({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkillsState();
}

class _SkillsState extends ConsumerState<Skills> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    final currentWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: currentWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Skills',
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontWeight: FontWeight.bold,
                  color: theme == ThemeMode.dark
                      ? AppColors().lightBlueColor.withOpacity(0.9)
                      : AppColors().darkBlueColor.withOpacity(0.9),
                ),
          ),
          SizedBox(
            height: currentWidth * 0.02,
          ),
          currentWidth > 1100
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        SocialIcon(
                          icon: 'assets/flutter.svg',
                          title: 'Flutter',
                        ),
                        SocialIcon(
                          icon: 'assets/firebase.svg',
                          title: 'Firebase',
                        ),
                        SocialIcon(
                          icon: 'assets/dart.svg',
                          title: 'Dart',
                        ),
                        SocialIcon(
                          icon: 'assets/react.svg',
                          title: 'React Native',
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SocialIcon(
                          icon: 'assets/tailwind.svg',
                          title: 'Tailwind Css',
                        ),
                        const SocialIcon(
                          icon: 'assets/ts.svg',
                          title: 'Typescript',
                        ),
                        const SocialIcon(
                          icon: 'assets/figma.svg',
                          title: 'Figma',
                        ),
                        SocialIcon(
                          icon: theme == ThemeMode.dark
                              ? 'assets/notion_white.svg'
                              : 'assets/notion.svg',
                          title: 'Notion',
                        ),
                      ],
                    )
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SocialIcon(
                      icon: 'assets/flutter.svg',
                      title: 'Flutter',
                    ),
                    const SocialIcon(
                      icon: 'assets/firebase.svg',
                      title: 'Firebase',
                    ),
                    const SocialIcon(
                      icon: 'assets/dart.svg',
                      title: 'Dart',
                    ),
                    const SocialIcon(
                      icon: 'assets/react.svg',
                      title: 'React Native',
                    ),
                    const SocialIcon(
                      icon: 'assets/tailwind.svg',
                      title: 'Tailwind Css',
                    ),
                    const SocialIcon(
                      icon: 'assets/ts.svg',
                      title: 'Typescript',
                    ),
                    const SocialIcon(
                      icon: 'assets/figma.svg',
                      title: 'Figma',
                    ),
                    SocialIcon(
                      icon: theme == ThemeMode.dark
                          ? 'assets/notion_white.svg'
                          : 'assets/notion.svg',
                      title: 'Notion',
                    ),
                  ],
                )
        ],
      ),
    );
  }
}

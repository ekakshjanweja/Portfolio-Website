import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';
import 'package:portfolio_website/widgets/social_icon.dart';

class SocialSection extends ConsumerWidget {
  const SocialSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);
    final currentWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      width: currentWidth,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Socials',
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
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SocialIcon(
                      icon: 'assets/twitter.svg',
                      title: 'Twitter',
                    ),
                    const SocialIcon(
                      icon: 'assets/linkedin.svg',
                      title: 'Linkedin',
                    ),
                    SocialIcon(
                      icon: theme == ThemeMode.light
                          ? 'assets/github_black.svg'
                          : 'assets/github_white.svg',
                      title: 'Github',
                    ),
                    const SocialIcon(
                      icon: 'assets/hashnode.svg',
                      title: 'Hashnode',
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const SocialIcon(
                      icon: 'assets/twitter.svg',
                      title: 'Twitter',
                    ),
                    const SocialIcon(
                      icon: 'assets/linkedin.svg',
                      title: 'Linkedin',
                    ),
                    SocialIcon(
                      icon: theme == ThemeMode.light
                          ? 'assets/github_black.svg'
                          : 'assets/github_white.svg',
                      title: 'Github',
                    ),
                    const SocialIcon(
                      icon: 'assets/hashnode.svg',
                      title: 'Hashnode',
                    ),
                  ],
                )
        ],
      ),
    );
  }
}

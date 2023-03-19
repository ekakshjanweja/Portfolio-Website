import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/widgets/icons/alt_icon_widget.dart';
import 'package:portfolio_website/common/widgets/icons/icon_widget.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

class SkillsLarge extends ConsumerStatefulWidget {
  const SkillsLarge({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SkillsLargeState();
}

class _SkillsLargeState extends ConsumerState<SkillsLarge> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    final List<AltIconWidget> socialHandle = [
      AltIconWidget(
        icon: Assets.logos.flutter,
        title: 'Flutter',
        url: Strings.flutter,
      ),
      AltIconWidget(
        icon: Assets.logos.firebase,
        title: 'Firebase',
        url: Strings.firebase,
      ),
      AltIconWidget(
        icon: Assets.logos.dart,
        title: 'Dart',
        url: Strings.dart,
      ),
      AltIconWidget(
        icon: Assets.logos.figma,
        title: 'Figma',
        url: Strings.figma,
      ),
      AltIconWidget(
        icon: theme == ThemeMode.dark
            ? Assets.logos.notionWhite
            : Assets.logos.notion,
        title: 'Notion',
        url: Strings.notion,
      ),
      AltIconWidget(
        icon: Assets.logos.react,
        title: 'React Native',
        url: Strings.reactNative,
      ),
      AltIconWidget(
        icon: Assets.logos.ts,
        title: 'Typescript',
        url: Strings.typescript,
      ),
      AltIconWidget(
        icon: Assets.logos.tailwind,
        title: 'Tailwind CSS',
        url: Strings.tailwindCss,
      ),
    ];

    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Headline

          Text(
            'Skills',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: Dimensions.mediumTextSize,
                  color: theme == ThemeMode.dark
                      ? AppColors().lightBlueColor
                      : AppColors().darkBlueColor,
                ),
          ),

          //Icons Row

          const SizedBox(height: 20),

          Wrap(
            children: socialHandle,
          ),
        ],
      ),
    );
  }
}

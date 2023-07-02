import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class NotwhatsappCard extends ConsumerStatefulWidget {
  const NotwhatsappCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotwhatsappCardState();
}

class _NotwhatsappCardState extends ConsumerState<NotwhatsappCard> {
  bool isNotWhatsapp = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return Container(
      width: 200,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(right: 20, bottom: 30),
      decoration: BoxDecoration(
        color: theme == ThemeMode.dark
            ? AppColors().containerColor
            : AppColors().containerColorLight,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Heading

          MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (event) => setState(() {
              isNotWhatsapp = true;
            }),
            onExit: (event) => setState(() {
              isNotWhatsapp = false;
            }),
            child: Text(
              'Not Whatsapp - A WhatsApp Clone',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: Dimensions.mediumTextSize,
                    color: isNotWhatsapp
                        ? Colors.deepOrange
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),

          const SizedBox(height: 20),

          //Sub Heading

          Text(
            'OCT\'22 - NOV\'22',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: Dimensions.smallerTextSize,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.5),
                ),
          ),

          const SizedBox(height: 20),

          //Links

          Wrap(
            children: [
              //Apk

              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: FilledButton.tonalIcon(
                  style: FilledButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .tertiaryContainer
                          .withOpacity(0.4)),
                  onPressed: () {
                    LaunchUrl().launchUrl(Strings.notwhatsappApk);
                  },
                  icon: const Icon(
                    Icons.android,
                    size: Dimensions.smallerTextSize,
                  ),
                  label: const Text('Apk'),
                ),
              ),

              //Github

              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FilledButton.tonalIcon(
                  style: FilledButton.styleFrom(
                      elevation: 0,
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .tertiaryContainer
                          .withOpacity(0.4)),
                  onPressed: () {
                    LaunchUrl().launchUrl(Strings.notwhatsappGithub);
                  },
                  icon: SvgPicture.asset(
                    theme == ThemeMode.dark
                        ? Assets.logos.githubWhite
                        : Assets.logos.githubBlack,
                    height: Dimensions.smallerTextSize,
                  ),
                  label: const Text('GitHub'),
                ),
              ),
            ],
          ),

          //Details

          // const SizedBox(height: 20),

          // Strings().notWhatsappDesc(context, ref),

          // const SizedBox(height: 20),
        ],
      ),
    );
  }
}

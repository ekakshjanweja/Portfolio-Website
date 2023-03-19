import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/pages/tbb_page.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/common/widgets/icons/alt_icon_widget.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class TbbCard extends ConsumerStatefulWidget {
  const TbbCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TbbCardState();
}

class _TbbCardState extends ConsumerState<TbbCard> {
  bool istbb = false;
  bool istas = false;
  bool isiwontforget = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(right: 40, bottom: 40),
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
              istbb = true;
            }),
            onExit: (event) => setState(() {
              istbb = false;
            }),
            child: Text(
              'Team Black Box',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: Dimensions.mediumTextSize,
                    color: istbb
                        ? Colors.red
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),

          const SizedBox(height: 20),

          //Sub Heading

          Wrap(
            children: [
              Text(
                'Full Stack Intern',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: Dimensions.smallerTextSize,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: 40),
              Text(
                'JAN\'23 - Present',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: Dimensions.smallerTextSize,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(0.5),
                    ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          //Projects

          Text(
            'Projects',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: Dimensions.smallTextSize,
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                ),
          ),

          const SizedBox(height: 20),

          Wrap(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, bottom: 10),
                child: FilledButton.tonal(
                  style: FilledButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .tertiaryContainer
                          .withOpacity(0.4)),
                  onPressed: () {
                    LaunchUrl().launchUrl(Strings.takeASip);
                  },
                  child: const Text('Take A Sip'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: FilledButton.tonal(
                  style: FilledButton.styleFrom(
                      padding: const EdgeInsets.all(20),
                      backgroundColor: Theme.of(context)
                          .colorScheme
                          .tertiaryContainer
                          .withOpacity(0.4)),
                  onPressed: () {},
                  child: const Text('I won\'t forget'),
                ),
              ),
            ],
          ),

          //Body

          const SizedBox(height: 20),

          Text(
            'At Team Black Box, I am gaining valuable experience working on innovative projects and cutting-edge technology. Building intuitive apps and utilizing modern technologies like React Native and api like compromise.cool, I\'m excited to continue creating amazing products with the team.',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),

          const SizedBox(height: 20),

          //Button

          const SizedBox(height: 20),

          Hero(
            tag: 'tbb',
            child: FilledButton.tonal(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.topToBottom,
                    child: const TbbPage(),
                  ),
                );
              },
              child: Text(
                'Show More',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: Dimensions.smallerTextSize,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

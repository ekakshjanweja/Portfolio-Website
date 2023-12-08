import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/pages/workex/tbb_page.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
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
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(right: 10, bottom: 10),
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

          GestureDetector(
            onTap: () => LaunchUrl().launchUrl(Strings.tbb),
            child: MouseRegion(
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
                      fontSize: Dimensions.smallTextSize,
                      color: istbb
                          ? Colors.red
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),
          ),

          const SizedBox(height: 5),

          //Sub Heading

          Wrap(
            children: [
              Text(
                'Mobile Intern',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: Dimensions.smallerTextSize,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              const SizedBox(width: 20),
              Text(
                'Jan\'23 - Jun\'23',
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

          // //Projects

          // Text(
          //   'Projects',
          //   style: Theme.of(context).textTheme.titleLarge!.copyWith(
          //         fontSize: Dimensions.smallTextSize,
          //         color: Theme.of(context).colorScheme.onPrimaryContainer,
          //       ),
          // ),

          // const SizedBox(height: 20),

          // Wrap(
          //   children: [
          //     Padding(
          //       padding: const EdgeInsets.only(right: 10, bottom: 10),
          //       child: FilledButton.tonal(
          //         style: FilledButton.styleFrom(
          //             padding: const EdgeInsets.all(20),
          //             backgroundColor: Theme.of(context)
          //                 .colorScheme
          //                 .tertiaryContainer
          //                 .withOpacity(0.4)),
          //         onPressed: () {
          //           LaunchUrl().launchUrl(Strings.takeASip);
          //         },
          //         child: const Text('Take A Sip'),
          //       ),
          //     ),
          //     Padding(
          //       padding: const EdgeInsets.only(bottom: 10),
          //       child: FilledButton.tonal(
          //         style: FilledButton.styleFrom(
          //             padding: const EdgeInsets.all(20),
          //             backgroundColor: Theme.of(context)
          //                 .colorScheme
          //                 .tertiaryContainer
          //                 .withOpacity(0.4)),
          //         onPressed: () {
          //           LaunchUrl().launchUrl(Strings.iWontForgetPlaystore);
          //         },
          //         child: const Text('I won\'t forget'),
          //       ),
          //     ),
          //   ],
          // ),

          //Body

          // const SizedBox(height: 20),

          // Text(
          //   'In just six months, I embarked on an incredible journey of growth, honing valuable skills while building and breaking things. Working alongside an extraordinary team brought immense joy and provided a supportive environment for my development. The mentorship I received was nothing short of amazing. This experience added numerous valuable tools to my skill set, equipping me for future challenges. It was an unforgettable adventure filled with fun, learning, and personal growth.',
          //   style: GoogleFonts.josefinSans(
          //     fontSize: Dimensions.smallerTextSize,
          //     fontWeight: FontWeight.w300,
          //     color: Theme.of(context).colorScheme.onPrimaryContainer,
          //   ),
          // ),

          // const SizedBox(height: 10),

          //Button

          const SizedBox(height: 5),

          Hero(
            tag: 'tbb',
            child: FilledButton.tonal(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.fade,
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

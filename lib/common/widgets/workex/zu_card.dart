import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/pages/workex/zu_page.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

import '../../constants/strings.dart';

class ZuCard extends ConsumerStatefulWidget {
  const ZuCard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZuCardState();
}

class _ZuCardState extends ConsumerState<ZuCard> {
  bool isZu = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageTransition(
            type: PageTransitionType.fade,
            child: const ZuPage(),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: theme == ThemeMode.dark
              ? AppColors().containerColor
              : AppColors().containerColorLight,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Heading

            GestureDetector(
              onTap: () => LaunchUrl().launchUrl(Strings.zu),
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (event) => setState(() {
                  isZu = true;
                }),
                onExit: (event) => setState(() {
                  isZu = false;
                }),
                child: Text(
                  'Zu',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        fontSize: Dimensions.smallTextSize,
                        color: isZu
                            ? const Color(0xff8865D9)
                            : Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),
              ),
            ),

            const SizedBox(height: 5),

            //Sub Heading

            Column(
              children: [
                Text(
                  'Flutter Intern',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: Dimensions.smallerTextSize,
                      color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                Text(
                  'Oct\'21 - Jan\'22',
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

            //Body

            // Text(
            //   'ZuPay is an investing cum learning app for teenagers. It’s a platform where a teenager can do all sorts of things from learning about investment to actually investing in the market and buying real stocks.',
            //   style: GoogleFonts.josefinSans(
            //     fontSize: Dimensions.smallerTextSize,
            //     fontWeight: FontWeight.w300,
            //     color: Theme.of(context).colorScheme.onPrimaryContainer,
            //   ),
            // ),

            //Button

            const SizedBox(height: 5),

            Hero(
              tag: 'zu',
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const ZuPage(),
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
      ),
    );
  }
}

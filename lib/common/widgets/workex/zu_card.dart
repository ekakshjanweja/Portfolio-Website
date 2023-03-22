import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/pages/workex/zu_page.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/common/widgets/icons/alt_icon_widget.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

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

    return Container(
      width: 300,
      padding: const EdgeInsets.all(30),
      margin: const EdgeInsets.only(bottom: 40),
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
              isZu = true;
            }),
            onExit: (event) => setState(() {
              isZu = false;
            }),
            child: Text(
              'ZU',
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: Dimensions.mediumTextSize,
                    color: isZu
                        ? const Color(0xff8865D9)
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),

          const SizedBox(height: 20),

          //Sub Heading

          Wrap(
            children: [
              Text(
                'Flutter Development Intern',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: Dimensions.smallerTextSize,
                    color: Theme.of(context).colorScheme.onPrimaryContainer),
              ),
              Text(
                'OCT\'21 - JAN\'22',
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

          //Body

          Text(
            'ZuPay is an investing cum learning app for teenagers. It’s a platform where a teenager can do all sorts of things from learning about investment to actually investing in the market and buying real stocks.',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),

          //Button

          const SizedBox(height: 20),

          Hero(
            tag: 'zu',
            child: FilledButton.tonal(
              onPressed: () {
                Navigator.of(context).push(
                  PageTransition(
                    type: PageTransitionType.topToBottom,
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
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

import '../../utils/launch_url.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> {
  bool whoAmI = false;
  bool whatAmICurrentlyDoing = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        alignment: Alignment.center,
        color: theme == ThemeMode.dark
            ? AppColors().containerColor
            : AppColors().containerColorLight,
        child: SizedBox(
          width: 600,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      //Close Button

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer,
                          ),
                          child: IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(
                              Icons.close,
                              size: Dimensions.smallerTextSize,
                            ),
                          ),
                        ),
                      ),

                      //Heading

                      Padding(
                        padding: const EdgeInsets.only(bottom: 10, left: 30),
                        child: Text(
                          'About Me',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: Dimensions.largeTextSize,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  //Who Am I?

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => setState(() {
                      whoAmI = true;
                    }),
                    onExit: (event) => setState(() {
                      whoAmI = false;
                    }),
                    child: Text(
                      'Who Am I?',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.smallTextSize,
                                color: whoAmI
                                    ? AppColors().blueColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Strings().whoAmI(context, ref),

                  const SizedBox(height: 40),

                  //What Am I currently doing?

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => setState(() {
                      whatAmICurrentlyDoing = true;
                    }),
                    onExit: (event) => setState(() {
                      whatAmICurrentlyDoing = false;
                    }),
                    child: Text(
                      'What Am I currently doing?',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.smallTextSize,
                                color: whatAmICurrentlyDoing
                                    ? AppColors().blueColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

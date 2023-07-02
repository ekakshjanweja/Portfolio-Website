import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class TbbPage extends ConsumerStatefulWidget {
  const TbbPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TbbPageState();
}

class _TbbPageState extends ConsumerState<TbbPage> {
  bool istbb = false;
  bool istas = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return Hero(
      tag: 'tbb',
      child: SafeArea(
        child: SelectionArea(
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              color: theme == ThemeMode.dark
                  ? AppColors().containerColor
                  : AppColors().containerColorLight,
              child: SizedBox(
                width: 800,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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

                            MouseRegion(
                              cursor: SystemMouseCursors.click,
                              onEnter: (event) => setState(() {
                                istbb = true;
                              }),
                              onExit: (event) => setState(() {
                                istbb = false;
                              }),
                              child: GestureDetector(
                                onTap: () {
                                  LaunchUrl().launchUrl(Strings.tbb);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 30),
                                  child: Text(
                                    'Team Black Box',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: Dimensions.largeTextSize,
                                          color: istbb
                                              ? Colors.red
                                              : Theme.of(context)
                                                  .colorScheme
                                                  .onPrimaryContainer,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 40),

                        //Take A Sip

                        MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (event) => setState(() {
                            istas = true;
                          }),
                          onExit: (event) => setState(() {
                            istas = false;
                          }),
                          child: Text(
                            'Take A Sip',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(
                                  fontSize: Dimensions.mediumTextSize,
                                  color: istas
                                      ? AppColors().blueColor
                                      : Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        Strings().takeASipDesc(context, ref),

                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 20),
                          child: FilledButton.tonalIcon(
                            style: FilledButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer
                                    .withOpacity(0.4)),
                            onPressed: () {
                              LaunchUrl().launchUrl(Strings.takeASipPlaystore);
                            },
                            icon: SvgPicture.asset(
                              Assets.logos.playstore,
                              height: Dimensions.smallerTextSize,
                            ),
                            label: const Text('Playstore'),
                          ),
                        ),

                        //I Won't Forget

                        const SizedBox(height: 40),

                        Text(
                          'I Wont\'t Forget',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),

                        const SizedBox(height: 20),

                        Strings().iWontForgetDesc(context, ref),

                        const SizedBox(height: 20),

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 20),
                          child: FilledButton.tonalIcon(
                            style: FilledButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer
                                    .withOpacity(0.4)),
                            onPressed: () {
                              LaunchUrl()
                                  .launchUrl(Strings.iWontForgetPlaystore);
                            },
                            icon: SvgPicture.asset(
                              Assets.logos.playstore,
                              height: Dimensions.smallerTextSize,
                            ),
                            label: const Text('Playstore'),
                          ),
                        ),

                        //Land Blocks

                        const SizedBox(height: 40),

                        Text(
                          'Land Blocks',
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onPrimaryContainer,
                              ),
                        ),

                        const SizedBox(height: 20),

                        Strings().landBlocksDesc(context, ref),

                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

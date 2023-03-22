import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class ZuPage extends ConsumerStatefulWidget {
  const ZuPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZuPageState();
}

class _ZuPageState extends ConsumerState<ZuPage> {
  bool isZu = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Hero(
      tag: 'zu',
      child: Scaffold(
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
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 30),
                              child: Text(
                                'Zu',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: Dimensions.largeTextSize,
                                      color: isZu
                                          ? const Color(0xff8865D9)
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

                    Strings().zuDesc(context, ref),

                    //Button

                    const SizedBox(
                      height: 20,
                    ),

                    Wrap(
                      children: [
                        //Playstore

                        Padding(
                          padding: const EdgeInsets.only(bottom: 10, right: 30),
                          child: FilledButton.tonalIcon(
                            style: FilledButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(20),
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .tertiaryContainer
                                    .withOpacity(0.4)),
                            onPressed: () {
                              LaunchUrl().launchUrl(Strings.zuPlaystore);
                            },
                            icon: SvgPicture.asset(
                              Assets.logos.playstore,
                              height: Dimensions.smallerTextSize,
                            ),
                            label: const Text('ZuPay'),
                          ),
                        ),

                        //Website

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
                              LaunchUrl().launchUrl(Strings.zu);
                            },
                            icon: const Icon(
                              Icons.web,
                              size: Dimensions.smallerTextSize,
                            ),
                            label: const Text('ZuPay'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

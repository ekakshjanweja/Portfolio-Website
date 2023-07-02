import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

import '../../../constants/strings.dart';

class DtuSocialPage extends ConsumerStatefulWidget {
  const DtuSocialPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DtuSocialPageState();
}

class _DtuSocialPageState extends ConsumerState<DtuSocialPage> {
  bool isDS = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Hero(
      tag: 'ds',
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

                            GestureDetector(
                              onTap: () =>
                                  LaunchUrl().launchUrl(Strings.dsInsta),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (event) => setState(() {
                                  isDS = true;
                                }),
                                onExit: (event) => setState(() {
                                  isDS = false;
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 30),
                                  child: Text(
                                    'dtu.social',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: Dimensions.largeTextSize,
                                          color: isDS
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

                        const SizedBox(
                          width: 800,
                          child: MD(),
                        ),

                        //Button

                        const SizedBox(
                          height: 20,
                        ),

                        Wrap(
                          children: [
                            //Playstore

                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, right: 30),
                              child: FilledButton.tonalIcon(
                                style: FilledButton.styleFrom(
                                    elevation: 0,
                                    padding: const EdgeInsets.all(20),
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer
                                        .withOpacity(0.4)),
                                onPressed: () {
                                  //LaunchUrl().launchUrl(Strings.zuPlaystore);
                                },
                                icon: SvgPicture.asset(
                                  Assets.logos.playstore,
                                  height: Dimensions.smallerTextSize,
                                ),
                                label: const Text('dtu.social'),
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
                                  LaunchUrl().launchUrl(Strings.dsWebsite);
                                },
                                icon: const FaIcon(
                                  FontAwesomeIcons.globe,
                                  size: Dimensions.smallerTextSize,
                                ),
                                label: const Text('dtu.social'),
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
        ),
      ),
    );
  }
}

class MD extends StatelessWidget {
  const MD({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Markdown(
      data: Strings.dtuSocial,
      shrinkWrap: true,
      selectable: true,
      onTapLink: (text, href, title) => LaunchUrl().launchUrl(href!),
      styleSheet: MarkdownStyleSheet(
        h1: Theme.of(context)
            .textTheme
            .headlineLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        h2: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        h3: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        p: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        listBullet: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        h1Padding: const EdgeInsets.symmetric(vertical: 20),
        h2Padding: const EdgeInsets.symmetric(vertical: 20),
        h3Padding: const EdgeInsets.symmetric(vertical: 20),
        pPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
      imageBuilder: (uri, title, alt) => Image.network(uri.toString()),
    );
  }
}

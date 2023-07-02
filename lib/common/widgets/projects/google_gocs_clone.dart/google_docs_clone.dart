import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

import '../../../constants/strings.dart';

class GoogleDocsClonePage extends ConsumerStatefulWidget {
  const GoogleDocsClonePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _GoogleDocsClonePageState();
}

class _GoogleDocsClonePageState extends ConsumerState<GoogleDocsClonePage> {
  bool isGDC = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    return Hero(
      tag: 'gdc',
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
                              onTap: () => LaunchUrl()
                                  .launchUrl(Strings.notwhatsappGithub),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                onEnter: (event) => setState(() {
                                  isGDC = true;
                                }),
                                onExit: (event) => setState(() {
                                  isGDC = false;
                                }),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, left: 30),
                                  child: Text(
                                    'Google Docs Clone',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineSmall!
                                        .copyWith(
                                          fontSize: Dimensions.largeTextSize,
                                          color: isGDC
                                              ? Colors.blue.shade400
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

                        Strings().googleDocsCloneDesc(context, ref),

                        //Button

                        const SizedBox(
                          height: 40,
                        ),

                        Wrap(
                          children: [
                            //Video

                            Padding(
                              padding:
                                  const EdgeInsets.only(right: 10, bottom: 10),
                              child: FilledButton.tonalIcon(
                                style: FilledButton.styleFrom(
                                    padding: const EdgeInsets.all(20),
                                    backgroundColor: Theme.of(context)
                                        .colorScheme
                                        .tertiaryContainer
                                        .withOpacity(0.4)),
                                onPressed: () {
                                  LaunchUrl()
                                      .launchUrl(Strings.googleDocsVideo);
                                },
                                icon: const Icon(
                                  Icons.movie,
                                  size: Dimensions.smallerTextSize,
                                ),
                                label: const Text('Video'),
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
                                  LaunchUrl()
                                      .launchUrl(Strings.googleDocsGithub);
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
            .copyWith(color: Theme.of(context).colorScheme.onSurfaceVariant),
        h1Padding: const EdgeInsets.symmetric(vertical: 20),
        h2Padding: const EdgeInsets.symmetric(vertical: 20),
        h3Padding: const EdgeInsets.symmetric(vertical: 20),
        pPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
    );
  }
}

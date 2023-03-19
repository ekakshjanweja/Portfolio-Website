import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/gen/assets.gen.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class ZuPage extends ConsumerStatefulWidget {
  const ZuPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ZuPageState();
}

class _ZuPageState extends ConsumerState<ZuPage> {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Zu',
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
                        const SizedBox(
                          width: 20,
                        ),
                        Container(
                          padding: const EdgeInsets.all(3),
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
                            icon: const Icon(Icons.close),
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
                        onPressed: () {},
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
              ),
            ),
          ),
        ),
      ),
    );
  }
}

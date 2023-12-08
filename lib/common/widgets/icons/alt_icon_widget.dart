import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

class AltIconWidget extends ConsumerStatefulWidget {
  final String icon;
  final String title;
  final String? url;
  const AltIconWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.url,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AltIconWidgetState();
}

class _AltIconWidgetState extends ConsumerState<AltIconWidget> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (event) => setState(() {
        isHovering = true;
      }),
      onExit: (event) => setState(() {
        isHovering = false;
      }),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 20, right: 20),
        child: GestureDetector(
          onTap: () {
            LaunchUrl().launchUrl(widget.url!);
          },
          child: Opacity(
            opacity: MediaQuery.of(context).size.width - 1 <
                        Dimensions.tabletWidth ||
                    ref.watch(themeProvider) == ThemeMode.light
                ? 1
                : isHovering
                    ? 1
                    : 0.8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              // decoration: BoxDecoration(
              //   borderRadius: BorderRadius.circular(10),
              //   border: Border.all(
              //     width: 1,
              //     color: theme == ThemeMode.dark
              //         ? AppColors().lightBlueColor.withOpacity(0.3)
              //         : AppColors().darkBlueColor.withOpacity(0.3),
              //   ),
              // ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgPicture.asset(
                    widget.icon,
                    height: Dimensions.smallerTextSize,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    widget.title,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          fontSize: Dimensions.smallerTextSize,
                          color: theme == ThemeMode.dark
                              ? AppColors().lightBlueColor
                              : AppColors().darkBlueColor,
                        ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

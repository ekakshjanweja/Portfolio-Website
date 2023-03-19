import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/responsive/dimensions.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

class IconWidget extends ConsumerStatefulWidget {
  final String icon;
  final String title;
  final String? url;
  const IconWidget({
    super.key,
    required this.icon,
    required this.title,
    required this.url,
  });

  @override
  ConsumerState<IconWidget> createState() => _IconWidgetState();
}

class _IconWidgetState extends ConsumerState<IconWidget> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        LaunchUrl().launchUrl(widget.url!);
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (event) => setState(() {
          isHovering = true;
        }),
        onExit: (event) => setState(() {
          isHovering = false;
        }),
        child: Opacity(
          opacity:
              MediaQuery.of(context).size.width - 1 < Dimensions.tabletWidth ||
                      ref.watch(themeProvider) == ThemeMode.light
                  ? 1
                  : isHovering
                      ? 1
                      : 0.5,
          child: SvgPicture.asset(
            widget.icon,
            height: Dimensions.smallTextSize,
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

class SocialIcon extends ConsumerStatefulWidget {
  final String icon;
  final String title;
  const SocialIcon({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  ConsumerState<SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends ConsumerState<SocialIcon> {
  bool isHovering = false;
  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = ref.watch(themeProvider);
    return MouseRegion(
      onEnter: (e) {
        setState(() {
          isHovering = true;
        });
      },
      onExit: (e) {
        setState(() {
          isHovering = false;
        });
      },
      child: Opacity(
        opacity: isHovering ? 1 : 0.4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              MediaQuery.of(context).size.width > 1100
                  ? SvgPicture.asset(
                      widget.icon,
                      height: MediaQuery.of(context).size.width * 0.02,
                      width: 28,
                    )
                  : SvgPicture.asset(
                      widget.icon,
                      height: MediaQuery.of(context).size.width * 0.04,
                    ),
              const SizedBox(width: 20),
              Text(
                widget.title,
                style: MediaQuery.of(context).size.width > 1050
                    ? Theme.of(context).textTheme.headlineSmall!.copyWith(
                          color: theme == ThemeMode.dark
                              ? AppColors().lightBlueColor
                              : AppColors().darkBlueColor,
                        )
                    : Theme.of(context).textTheme.headlineSmall!.copyWith(
                          fontSize: MediaQuery.of(context).size.width * 0.04,
                          color: theme == ThemeMode.dark
                              ? AppColors().lightBlueColor
                              : AppColors().darkBlueColor,
                        ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class ProjectCard extends ConsumerStatefulWidget {
  final String name;
  final String timeline;
  final Function() onPressed;
  final Color hoverColor;
  final String heroTag;

  const ProjectCard({
    super.key,
    required this.name,
    required this.timeline,
    required this.onPressed,
    required this.hoverColor,
    required this.heroTag,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  bool isProjectCard = false;

  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return Container(
      width: 200,
      padding: const EdgeInsets.all(25),
      margin: const EdgeInsets.only(bottom: 30),
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
              isProjectCard = true;
            }),
            onExit: (event) => setState(() {
              isProjectCard = false;
            }),
            child: Text(
              widget.name,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontSize: Dimensions.smallTextSize,
                    color: isProjectCard
                      ? widget.hoverColor
                        : Theme.of(context).colorScheme.onPrimaryContainer,
                  ),
            ),
          ),

          const SizedBox(height: 20),

          //Sub Heading

          Text(
            widget.timeline,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  fontSize: Dimensions.smallerTextSize,
                  color: Theme.of(context)
                      .colorScheme
                      .onPrimaryContainer
                      .withOpacity(0.5),
                ),
          ),

          const SizedBox(height: 20),

          //Links

          Hero(
            tag: widget.heroTag,
            child: FilledButton.tonal(
              onPressed: widget.onPressed,
              child: Text(
                'Show More',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      fontSize: Dimensions.smallerTextSize,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';

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
    return GestureDetector(
      onTap: widget.onPressed,
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 20),
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
                      fontSize: 14,
                      color: isProjectCard
                          ? widget.hoverColor
                          : Theme.of(context).colorScheme.onPrimaryContainer,
                    ),
              ),
            ),

            const SizedBox(height: 5),

            //Sub Heading

            Text(
              widget.timeline,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 14,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimaryContainer
                        .withOpacity(0.5),
                  ),
            ),

            const SizedBox(height: 5),

            //Links

            Hero(
              tag: widget.heroTag,
              child: GestureDetector(
                onTap: widget.onPressed,
                child: Text(
                  'Show More',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

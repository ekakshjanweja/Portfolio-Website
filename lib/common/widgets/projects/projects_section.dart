import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/widgets/projects/googledocs_clone_card.dart';
import 'package:portfolio_website/common/widgets/projects/notwhatsapp_card.dart';
import 'package:portfolio_website/common/widgets/projects/portfolio_card.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class ProjectsSection extends ConsumerWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Projects',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: Dimensions.mediumTextSize,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(
            height: 20,
          ),
          Wrap(
            children: const [
              NotwhatsappCard(),
              GoogleDocsCloneCard(),
              PortfolioWebsiteCard()
            ],
          )
        ],
      ),
    );
  }
}

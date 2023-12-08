import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/widgets/projects/dtu_social/dtu_social.dart';
import 'package:portfolio_website/common/widgets/projects/google_gocs_clone.dart/google_docs_clone.dart';
import 'package:portfolio_website/common/widgets/projects/not_whatsapp/not_whatsapp.dart';
import 'package:portfolio_website/common/widgets/projects/project_card.dart';
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
            spacing: 10,
            children: [
              ProjectCard(
                name: 'dtu.social',
                timeline: 'Jan\'23 - Sept\'23',
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const DtuSocialPage(),
                    ),
                  );
                },
                hoverColor: Colors.deepPurple.shade400,
                heroTag: 'ds',
              ),
              ProjectCard(
                name: 'gdocs',
                timeline: 'Dec\'22',
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const GoogleDocsClonePage(),
                    ),
                  );
                },
                hoverColor: Colors.blue.shade400,
                heroTag: 'gdc',
              ),
              ProjectCard(
                name: 'NotWhatsApp',
                timeline: 'Oct\'22 - Nov\'22',
                onPressed: () {
                  Navigator.of(context).push(
                    PageTransition(
                      type: PageTransitionType.fade,
                      child: const NotWhatsappPage(),
                    ),
                  );
                },
                hoverColor: Colors.deepOrange.shade400,
                heroTag: 'notwa',
              ),
              ProjectCard(
                name: 'Portfolio Website',
                timeline: 'Aug\'22',
                onPressed: () {
                  LaunchUrl().launchUrl(Strings.portfolio);
                },
                hoverColor: Colors.teal,
                heroTag: 'pw',
              ),
            ],
          )
        ],
      ),
    );
  }
}

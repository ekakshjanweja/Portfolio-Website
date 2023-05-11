import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/common/widgets/workex/tbb_card.dart';
import 'package:portfolio_website/common/widgets/workex/zu_card.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class WorkEx extends ConsumerWidget {
  const WorkEx({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Work Experience',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontSize: Dimensions.mediumTextSize,
                color: Theme.of(context).colorScheme.onPrimaryContainer),
          ),
          const SizedBox(
            height: 20,
          ),
          const Wrap(
            children: [
              TbbCard(),
              ZuCard(),
            ],
          ),
        ],
      ),
    );
  }
}

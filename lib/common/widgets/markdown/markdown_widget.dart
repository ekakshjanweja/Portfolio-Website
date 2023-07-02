import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/widgets/navbars/bottom_bar.dart';
import 'package:portfolio_website/models/post_model.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class MarkdownView extends StatelessWidget {
  final PostModel post;
  const MarkdownView({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'blogpage',
      child: SafeArea(
        child: Scaffold(
          body: Center(
            child: SizedBox(
              width: 800,
              child: ScrollConfiguration(
                behavior:
                    ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 800,
                        child: Image.network(
                          post.coverImage,
                          fit: BoxFit.fitWidth,
                          alignment: Alignment.bottomCenter,
                        ),
                      ),

                      const SizedBox(
                        height: 40,
                      ),

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
                              size: Dimensions.largeTextSize,
                            ),
                          ),
                        ),
                      ),

                      MarkdownWidget(post: post),

                      //End

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.max,
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
                                    Icons.arrow_back,
                                    size: Dimensions.smallerTextSize,
                                  ),
                                ),
                              ),
                            ),

                            //Heading

                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 10, left: 30),
                              child: Text(
                                'Head Back',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall!
                                    .copyWith(
                                      fontSize: Dimensions.largeTextSize,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 80,
                      ),

                      const BottomBar(),
                    ],
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

class MarkdownWidget extends StatelessWidget {
  const MarkdownWidget({
    super.key,
    required this.post,
  });

  final PostModel post;

  @override
  Widget build(BuildContext context) {
    return Markdown(
      physics: const BouncingScrollPhysics(),
      data: post.contentMarkdown,
      shrinkWrap: true,
      selectable: true,
      onTapLink: (text, href, title) => LaunchUrl().launchUrl(href!),
      styleSheet: MarkdownStyleSheet(
        h1: Theme.of(context).textTheme.headlineLarge!.copyWith(
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
        h2: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        h3: Theme.of(context)
            .textTheme
            .headlineSmall!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        p: Theme.of(context).textTheme.titleLarge!.copyWith(
            color: Theme.of(context)
                .colorScheme
                .onPrimaryContainer
                .withOpacity(0.6)),
        listBullet: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(color: Theme.of(context).colorScheme.onPrimaryContainer),
        h1Padding: const EdgeInsets.symmetric(vertical: 20),
        h2Padding: const EdgeInsets.symmetric(vertical: 20),
        h3Padding: const EdgeInsets.symmetric(vertical: 20),
        pPadding: const EdgeInsets.symmetric(vertical: 10),
      ),
      imageBuilder: (uri, title, alt) => Image.network(uri.toString()),
    );
  }
}

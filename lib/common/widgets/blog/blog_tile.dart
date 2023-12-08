import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/widgets/markdown/markdown_widget.dart';
import 'package:portfolio_website/models/post_model.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class BlogTile extends StatelessWidget {
  final PostModel post;
  const BlogTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width > Dimensions.desktopWidth) {
      return Hero(
        tag: 'blogpage',
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                type: PageTransitionType.fade,
                child: MarkdownView(post: post),
              ),
            );
          },
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                //Image 1

                // ClipRRect(
                //   borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(10),
                //     bottomLeft: Radius.circular(10),
                //   ),
                //   child: SizedBox(
                //     width: 350,
                //     height: 350 / 1.904761904761905,
                //     child: Image.network(
                //       post.coverImage,
                //       fit: BoxFit.fitWidth,
                //     ),
                //   ),
                // ),

                //Blog Info

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(width: 20),

                        //Title

                        Expanded(
                          child: Text(
                            post.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    } else {
      return Hero(
        tag: 'blogpage',
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageTransition(
                type: PageTransitionType.fade,
                child: MarkdownView(post: post),
              ),
            );
          },
          child: Container(
            width: 350,
            margin: const EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Theme.of(context)
                  .colorScheme
                  .secondaryContainer
                  .withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                //Image 1

                // ClipRRect(
                //   borderRadius: const BorderRadius.only(
                //     topLeft: Radius.circular(10),
                //     topRight: Radius.circular(10),
                //   ),
                //   child: SizedBox(
                //     child: Image.network(
                //       post.coverImage,
                //       fit: BoxFit.fitHeight,
                //     ),
                //   ),
                // ),

                //Blog Info

                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //Title

                      Text(
                        post.title,
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onPrimaryContainer,
                                ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

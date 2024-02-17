import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/services/graphql_config.dart';
import 'package:portfolio_website/common/services/graphql_services.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
// ignore: unused_import
import 'package:portfolio_website/common/widgets/blog/blog_tile.dart';
import 'package:portfolio_website/common/widgets/markdown/markdown_widget.dart';
import 'package:portfolio_website/models/post_model.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class BlogMini extends ConsumerWidget {
  const BlogMini({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(themeProvider);

    return GraphQLProvider(
      client: GraphQLConfig().client,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Blogs

            Text(
              'Blogs',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: Dimensions.mediumTextSize,
                    color: theme == ThemeMode.dark
                        ? AppColors().lightBlueColor
                        : AppColors().darkBlueColor,
                  ),
            ),

            const SizedBox(height: 10),

            //Titles

            FutureBuilder(
              future: ref.watch(getPostsProivder.future),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as List<PostModel>;

                  return SizedBox(
                    child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      dragStartBehavior: DragStartBehavior.down,
                      physics: const BouncingScrollPhysics(),
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final blog = PostModel(
                          coverImage: data[index].coverImage,
                          title: data[index].title,
                          contentMarkdown: data[index].contentMarkdown,
                        );

                        return Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          child: Hero(
                            tag: 'blogpage',
                            child: GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: MarkdownView(post: blog),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    blog.title,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: Dimensions.smallTextSize,
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
                      },
                    ),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}

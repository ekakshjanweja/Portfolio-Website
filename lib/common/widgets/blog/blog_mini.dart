import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/services/graphql_config.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
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

            //Titiles

            Query(
              options: QueryOptions(document: gql("""{
                                    user(username: "stormej") {
                                    publication {
                                posts(page: 0) {
                                  _id
                                  cuid
                                  coverImage
                                  title
                                  contentMarkdown
                                }
                                    }
                                    }
                                  }""")),
              builder: (result, {fetchMore, refetch}) {
                if (result.data != null) {
                  List res = result.data!['user']['publication']['posts'];

                  return ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    dragStartBehavior: DragStartBehavior.down,
                    physics: const BouncingScrollPhysics(),
                    itemCount: res.length - 1,
                    itemBuilder: (context, index) {
                      final blog = PostModel(
                        coverImage: res[index]['coverImage'],
                        title: res[index]['title'],
                        contentMarkdown: res[index]['contentMarkdown'],
                      );

                      return Hero(
                        tag: 'blogpage',
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).push(
                            PageTransition(
                              type: PageTransitionType.fade,
                              child: MarkdownView(post: blog),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(bottom: 10),
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
                                const SizedBox(height: 5),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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

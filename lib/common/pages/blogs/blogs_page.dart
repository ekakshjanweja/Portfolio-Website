// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:portfolio_website/common/services/graphql_config.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/common/widgets/markdown/markdown_widget.dart';
import 'package:portfolio_website/models/post_model.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class BlogsPage extends ConsumerStatefulWidget {
  const BlogsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BlogsPageState();
}

class _BlogsPageState extends ConsumerState<BlogsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);
    return SafeArea(
      child: SelectionArea(
        child: GraphQLProvider(
          client: GraphQLConfig().client,
          child: Scaffold(
            body: Container(
              padding: const EdgeInsets.all(40),
              alignment: Alignment.center,
              color: theme == ThemeMode.dark
                  ? AppColors().containerColor
                  : AppColors().containerColorLight,
              child: SizedBox(
                width: 800,
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context)
                      .copyWith(scrollbars: false),
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
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
                                    Icons.close,
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
                                'Blogs',
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

                        const SizedBox(height: 40),

                        //Blog Cards

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
                              List res =
                                  result.data!['user']['publication']['posts'];

                              return SizedBox(
                                width: 350,
                                height: 600,
                                child: ListView.builder(
                                  shrinkWrap: true,
                                  primary: false,
                                  dragStartBehavior: DragStartBehavior.down,
                                  itemCount: res.length,
                                  itemBuilder: (context, index) {
                                    final test = PostModel(
                                      coverImage: res[index]['coverImage'],
                                      title: res[index]['title'],
                                      contentMarkdown: res[index]
                                          ['contentMarkdown'],
                                    );

                                    return Container(
                                      margin: const EdgeInsets.only(bottom: 20),
                                      child: BlogCard(post: test),
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
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class BlogCard extends StatelessWidget {
  final PostModel post;
  const BlogCard({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          //Image 1

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: SizedBox(
              child: Image.network(
                post.coverImage,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),

          //Blog Info

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Title

                Text(
                  post.title,
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onPrimaryContainer,
                      ),
                ),

                Hero(
                  tag: 'blogpage',
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: FilledButton.tonal(
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        backgroundColor: Theme.of(context)
                            .colorScheme
                            .background
                            .withOpacity(0.8),
                      ),
                      onPressed: () {
                        Navigator.of(context).push(
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: MarkdownView(post: post),
                          ),
                        );
                      },
                      child: const Text('Read More'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/common/constants/strings.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/launch_url.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
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
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        alignment: Alignment.center,
        color: theme == ThemeMode.dark
            ? AppColors().containerColor
            : AppColors().containerColorLight,
        child: SizedBox(
          width: 800,
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
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
                        padding: const EdgeInsets.only(bottom: 10, left: 30),
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

                  Wrap(
                    alignment: WrapAlignment.spaceBetween,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      //Blog 1

                      Container(
                        width: 350,
                        margin: const EdgeInsets.only(right: 30, bottom: 30),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                              child: Image.network(
                                'https://cdn.hashnode.com/res/hashnode/image/upload/v1671102283022/fUNreQXtm.jpeg?w=1600&h=840&fit=crop&crop=entropy&auto=compress,format&format=webp',
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
                                    'Team Black Box Internship Interview Experience',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                        ),
                                  ),

                                  const SizedBox(height: 20),

                                  //Info

                                  Text(
                                    'It sounds like the internship interview process at Team Black Box involves several stages, including an initial application, a video interview, and the completion of a project. The application form asks about the applicant\'s background, recent projects, learning habits, and areas of interest. The video interviews focus on the applicant\'s technical skills and also delve into their personal interests. As part of the process, applicants are also required to build a react native app and a react js web app in a short period of time. The final video interview allows for further discussion and reflection on the experience. Overall, the process appears to be designed to assess the applicant\'s technical skills, creativity, and overall personality.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: GoogleFonts.josefinSans(
                                      fontSize: Dimensions.smallerTextSize,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: FilledButton.tonal(
                                      style: FilledButton.styleFrom(
                                        padding: const EdgeInsets.all(20),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer
                                            .withOpacity(0.8),
                                      ),
                                      onPressed: () {
                                        LaunchUrl().launchUrl(Strings.blogTwo);
                                      },
                                      child: const Text('Read More'),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),

                      //Blog 2

                      Container(
                        width: 350,
                        margin: const EdgeInsets.only(bottom: 30),
                        decoration: BoxDecoration(
                          color:
                              Theme.of(context).colorScheme.secondaryContainer,
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
                              child: Image.network(
                                'https://cdn.hashnode.com/res/hashnode/image/upload/v1670696484622/9tFB9G1vA.png?w=1600&h=840&fit=crop&crop=entropy&auto=compress,format&format=webp',
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
                                    'A simple comparison between Flutter & React Native',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimaryContainer,
                                        ),
                                  ),

                                  const SizedBox(height: 20),

                                  //Info

                                  Text(
                                    'Flutter and React Native are both powerful and popular frameworks for mobile development. The choice of which framework to use will depend on a number of factors, including personal preference, project requirements, and the specific needs of your team and organization.',
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 5,
                                    style: GoogleFonts.josefinSans(
                                      fontSize: Dimensions.smallerTextSize,
                                      fontWeight: FontWeight.w300,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onPrimaryContainer,
                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: FilledButton.tonal(
                                      style: FilledButton.styleFrom(
                                        padding: const EdgeInsets.all(20),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .tertiaryContainer
                                            .withOpacity(0.8),
                                      ),
                                      onPressed: () {
                                        LaunchUrl().launchUrl(Strings.blogOne);
                                      },
                                      child: const Text('Read More'),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

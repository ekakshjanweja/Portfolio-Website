import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/common/theme/app_colors.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class AboutPage extends ConsumerStatefulWidget {
  const AboutPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutPageState();
}

class _AboutPageState extends ConsumerState<AboutPage> {
  bool whoAmI = false;
  bool whatAmICurrentlyDoing = false;
  bool currently = false;
  @override
  Widget build(BuildContext context) {
    final theme = ref.watch(themeProvider);

    //Person Behind The Code

    List<Text> personBehindTheCode = [
      //1

      Text(
        'I really enjoy UX design. I like making apps that not only work well, but also look good and are easy to use.',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.smallerTextSize,
          fontWeight: FontWeight.w300,
          height: 2,
          color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(
                ref.read(themeProvider) == ThemeMode.dark ? 0.8 : 1,
              ),
        ),
      ),

      //2

      Text(
        'I also enjoy playing Valorant, a tactical first-person shooter game. It\'s a fun way to unwind after a long day of coding.',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.smallerTextSize,
          fontWeight: FontWeight.w300,
          height: 2,
          color: Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(
                ref.read(themeProvider) == ThemeMode.dark ? 0.8 : 1,
              ),
        ),
      ),
    ];

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
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 5,
                  ),

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
                          'About Me',
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

                  //Who Am I?

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => setState(() {
                      whoAmI = true;
                    }),
                    onExit: (event) => setState(() {
                      whoAmI = false;
                    }),
                    child: Text(
                      'Who Am I?',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: whoAmI
                                    ? AppColors().blueColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Hi, I\'m Ekaksh Janweja. I\'m a sophomore at Delhi Technological University, studying civil engineering. However, my true passion is app development. I consider myself a full stack mobile app developer, which means I work on all aspects of app development, from front-end design to back-end functionality.',
                    style: GoogleFonts.josefinSans(
                      fontSize: Dimensions.smallerTextSize,
                      fontWeight: FontWeight.w300,
                      height: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(ref.read(themeProvider) == ThemeMode.dark
                              ? 0.8
                              : 1),
                    ),
                  ),

                  const SizedBox(height: 40),

                  //Preson Behind The Code

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => setState(() {
                      whatAmICurrentlyDoing = true;
                    }),
                    onExit: (event) => setState(() {
                      whatAmICurrentlyDoing = false;
                    }),
                    child: Text(
                      'Person behind the code',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: whatAmICurrentlyDoing
                                    ? AppColors().blueColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: personBehindTheCode.length,
                      itemBuilder: (context, index) => Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: personBehindTheCode[index],
                      ),
                    ),
                  ),

                  //Currently

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => setState(() {
                      currently = true;
                    }),
                    onExit: (event) => setState(() {
                      currently = false;
                    }),
                    child: Text(
                      'Currently,',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: currently
                                    ? AppColors().blueColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Currently, I\'m interning as a full stack app developer at TeamBlackBox. It\'s been a great experience so far and I\'ve learned a lot about what it takes to create a successful app. I\'m also working on DTU.Social, a location-based chat app for college students that aims to improve communication and connections among students. I\'m also an App Development Co-Lead at Google Developer Student Club DTU & IOSD DTU. It\'s an opportunity for me to share my knowledge and experience with other students who are interested in app development.',
                    style: GoogleFonts.josefinSans(
                      fontSize: Dimensions.smallerTextSize,
                      fontWeight: FontWeight.w300,
                      height: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(ref.read(themeProvider) == ThemeMode.dark
                              ? 0.8
                              : 1),
                    ),
                  ),

                  const SizedBox(height: 40),

                  //Previously

                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    onEnter: (event) => setState(() {
                      currently = true;
                    }),
                    onExit: (event) => setState(() {
                      currently = false;
                    }),
                    child: Text(
                      'Previously,',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                fontSize: Dimensions.mediumTextSize,
                                color: currently
                                    ? AppColors().blueColor
                                    : Theme.of(context)
                                        .colorScheme
                                        .onPrimaryContainer,
                              ),
                    ),
                  ),

                  const SizedBox(height: 20),

                  Text(
                    'Previously, I interned as a Flutter Developer at Zu. It was a good learning experience, but I\'m excited to be working on new projects now.',
                    style: GoogleFonts.josefinSans(
                      fontSize: Dimensions.smallerTextSize,
                      fontWeight: FontWeight.w300,
                      height: 2,
                      color: Theme.of(context)
                          .colorScheme
                          .onPrimaryContainer
                          .withOpacity(ref.read(themeProvider) == ThemeMode.dark
                              ? 0.8
                              : 1),
                    ),
                  ),

                  const SizedBox(height: 60),

                  //End Line

                  Text(
                    'Disclaimer: Any imperfections in me have been cleverly concealed.',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          fontSize: Dimensions.smallerTextSize,
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                        ),
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

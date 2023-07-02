import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/common/utils/providers/providers.dart';
import 'package:portfolio_website/responsive/dimensions.dart';

class Strings {
  //CV

  static const cv =
      'https://drive.google.com/file/d/1JBoUUrkOV0H3LnLFNcUy-uhhjMAnWRiV/view?usp=sharing';

  //Twitter

  static const twitter = 'https://twitter.com/ekaksh_janweja';

  //Instagram

  static const insta = 'https://www.instagram.com/ekakshjanweja/';

  //Linkedin

  static const linkedin = 'https://www.linkedin.com/in/ekakshjanweja/';

  //Github

  static const github = 'https://github.com/ekakshjanweja';

  //Hashnode

  static const hashnode = 'https://stormej.hashnode.dev/';

  //Flutter

  static const flutter = 'https://flutter.dev/';

  //Firebase

  static const firebase = 'https://firebase.google.com/';

  //Dart

  static const dart = 'https://dart.dev/';

  //Figma

  static const figma = 'https://www.figma.com/';

  //Notion

  static const notion = 'https://www.notion.so/';

  //React Native

  static const reactNative = 'https://reactnative.dev/';

  //Typescript

  static const typescript = 'https://www.typescriptlang.org/';

  //Tailwind Css

  static const tailwindCss = 'https://tailwindcss.com/';

  //Team Black Box

  static const tbb = 'https://teamblackbox.in/';

  //Take A Sip

  static const takeASip = 'https://takeasip.app/';

  //Take A Sip Playstore

  static const takeASipPlaystore =
      'https://play.google.com/store/apps/details?id=app.takeasip';

  //I wont forget

  static const iWontForgetPlaystore =
      'https://play.google.com/store/apps/details?id=app.iwontforget';

  //Zu

  static const zu = 'https://www.zupay.in/';

  //Zu playstore

  static const zuPlaystore =
      'https://play.google.com/store/apps/details?id=in.zupay.app';

  //NotWhatsapp Apk

  static const notwhatsappApk =
      'https://drive.google.com/file/d/1v4Gjv2rGPkc7SIudtZbGkxN6LbCQUTu9/view';

  //NotWhatsapp Github

  static const notwhatsappGithub =
      'https://github.com/ekakshjanweja/NotWhatsapp';

  //Google Docs Video

  static const googleDocsVideo =
      'https://www.youtube.com/watch?v=EKjbYMvR8xs&ab_channel=EkakshJanweja';

  //Google Docs Github

  static const googleDocsGithub =
      'https://github.com/ekakshjanweja/Google-Docs-Clone';

  //Portfolio

  static const portfolio = 'https://stormej.me/#/';

  //Portfolio Github

  static const portfolioGithub =
      'https://github.com/ekakshjanweja/Portfolio-Website';

  //Blog 2

  static const blogTwo =
      'https://stormej.hashnode.dev/team-black-box-internship-interview-experience';

  //Blog 1

  static const blogOne =
      'https://stormej.hashnode.dev/a-simple-comparison-between-flutter-react-native';

  //ZU Desc

  Text zuDesc(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        text:
            'As a Flutter Developer, I created multiple screens and implemented ',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.smallerTextSize,
          fontWeight: FontWeight.w300,
          color:
              Theme.of(context).colorScheme.onPrimaryContainer.withOpacity(0.8),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'dark mode ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                'for the initial versions of the application. For state management, I utilized the ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.8),
            ),
          ),
          TextSpan(
            text: 'riverpod package, ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                'and for efficient communication between the app and internal API, I used the dio package for GET and POST requests. This streamlined the app\'s performance and helped me create a seamless user experience.',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  //Take A Sip Desc

  Text takeASipDesc(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        text:
            'Take a Sip is a beautifully designed app that helps users stay hydrated by reminding them to drink water and allowing them to track their daily water intake. As part of the development team, I implemented ',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.smallerTextSize,
          fontWeight: FontWeight.w300,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'customizable sip units ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text: 'with volume and image options in ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
          TextSpan(
            text: 'React Native using zustand ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                'for state management. This feature enhances user experience by allowing them to personalize their hydration goals.',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
        ],
      ),
    );
  }

  //I wont forget desc

  Text iWontForgetDesc(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        text:
            'I Won\'t Forget is a simple reminders app that is yet to be released. As part of the development team, I utilized the ',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.smallerTextSize,
          fontWeight: FontWeight.w300,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'compromise.cool nlp tool to extract various parameters ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                'from the input text. This feature enhances the app\'s functionality and makes it easier for users to create reminders tailored to their needs. ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
        ],
      ),
    );
  }

  //Land Blocs Desc

  Text landBlocksDesc(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        text: 'Land Blocks is a geo mapping app in which I used ',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.smallerTextSize,
          fontWeight: FontWeight.w300,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'react-native-skia (by shopify) ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text: 'ibrary to construct a polygon with location coordinates.',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.smallerTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
        ],
      ),
    );
  }

  //Not Whatsapp Desc

  Text notWhatsappDesc(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        text: 'NotWhatsapp is my messaging app project built using ',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.mediumTextSize,
          fontWeight: FontWeight.w300,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Flutter and Firebase ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                ', specifically firebase_auth for authentication and cloud_firestore for database management. I use ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
          TextSpan(
            text: 'Riverpod for state management ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text: 'and have implemented ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
          TextSpan(
            text:
                'group chat, GIFs, emojis, status updates, video calls, and reply functionality. ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                'I have also integrated GIPHY for GIF support and Agora for video calling capabilities.',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
        ],
      ),
    );
  }

  //dtu.social

  static const dtuSocial =
      "### What is DTU.Social?\n[dtu.social](http://DTU.Social) is a platform that connects college students, helping them find like-minded individuals with similar interests and aspirations. It simplifies communication between strangers, fostering meaningful connections and friendships. By joining Dtu.Social, students become part of a vibrant community that enhances their college experience and opens up exciting opportunities for growth.\n";

  //dtu.social insta

  static const dsInsta = 'https://www.instagram.com/dtu.social/';

  //dtu.social website

  static const dsWebsite = 'https://www.dtu.social/';

  //Google Docs Clone Desc

  Text googleDocsCloneDesc(BuildContext context, WidgetRef ref) {
    return Text.rich(
      TextSpan(
        text: 'I built a Google Docs clone using ',
        style: GoogleFonts.josefinSans(
          fontSize: Dimensions.mediumTextSize,
          fontWeight: FontWeight.w300,
          color: Theme.of(context)
              .colorScheme
              .onPrimaryContainer
              .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
        ),
        children: <TextSpan>[
          TextSpan(
            text: 'Flutter ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text: 'for the front-end and',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
          TextSpan(
            text: ' NodeJS, Express & MongoDB ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text: 'for the back-end. For state management, I used ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
          TextSpan(
            text: 'Riverpod ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
          TextSpan(
            text:
                'and for real-time updates when the document is shared, I utilized ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w300,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryContainer
                  .withOpacity(
                      ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
            ),
          ),
          TextSpan(
            text: 'SocketIO. ',
            style: GoogleFonts.josefinSans(
              fontSize: Dimensions.mediumTextSize,
              fontWeight: FontWeight.w400,
              color: Theme.of(context).colorScheme.onPrimaryContainer,
            ),
          ),
        ],
      ),
    );
  }

  //Portfolio Desc

  Text portfolioDesc(BuildContext context, WidgetRef ref) {
    return Text(
      'Built with the magic of Flutter. Here you can see some of the cool projects I\'ve been working on and get to know a little bit about me. So feel free to browse around, get inspired, and if you\'re feeling friendly, drop me a message. Let\'s create something awesome together!',
      style: GoogleFonts.josefinSans(
        fontSize: Dimensions.smallerTextSize,
        fontWeight: FontWeight.w300,
        color: Theme.of(context)
            .colorScheme
            .onPrimaryContainer
            .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.6 : 1),
      ),
    );
  }

  //Who Am I?

  Text whoAmI(BuildContext context, WidgetRef ref) {
    return Text(
      'Well hello there, it\'s a pleasure to make your acquaintance! I\'m Ekaksh Janweja, a code-slinging, Valorant-playing, food-loving full-stack mobile app developer and UX designer extraordinaire. I\'ve got a passion for crafting beautiful, user-friendly apps that solve real-world problems, and I\'m always on the lookout for the latest and greatest in tech. But it\'s not just about coding for me - I\'m also a proud member of tech communities like GDSC DTU, Flutter Delhi, and IOSD DTU, where I serve as an App-Dev Co-Lead. I love sharing my knowledge and inspiring others to pursue their passions, whether that\'s through organizing events or mentoring fellow tech enthusiasts. And if you\'re wondering what I\'m up to at the moment, I\'m interning as a Full-Stack App Developer at TeamBlackBox and building dtu.social on the side - because why settle for just one project when you can juggle multiple like a pro?',
      style: GoogleFonts.josefinSans(
        fontSize: Dimensions.smallerTextSize,
        fontWeight: FontWeight.w300,
        height: 2,
        color: Theme.of(context)
            .colorScheme
            .onPrimaryContainer
            .withOpacity(ref.read(themeProvider) == ThemeMode.dark ? 0.8 : 1),
      ),
    );
  }
}

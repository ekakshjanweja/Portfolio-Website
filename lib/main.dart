import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/layouts/desktop/screens/desktop_home_page.dart';
import 'package:portfolio_website/layouts/mobile/screens/mobile_home_page.dart';
import 'package:portfolio_website/layouts/tablet/screens/tablet_home_page.dart';
import 'package:portfolio_website/responsive/responsive_layout.dart';
import 'package:portfolio_website/screens/home_page.dart';
import 'package:portfolio_website/theme/app_colors.dart';
import 'package:portfolio_website/utils/providers/providers.dart';

void main(List<String> args) {
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ref.watch(themeProvider),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: darkColorScheme,
        useMaterial3: true,
        textTheme: GoogleFonts.openSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: const ResponsiveLayout(
        mobile: MobileHomePage(),
        tablet: TabletHomePage(),
        desktop: DesktopHomePage(),
      ),
    );
  }
}

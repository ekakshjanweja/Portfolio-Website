import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio_website/layouts/desktop/widgets/desktop_navbar.dart';
import 'package:portfolio_website/widgets/navbar.dart';

class DesktopHomePage extends ConsumerWidget {
  const DesktopHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Dimensions

    final currentWidth = MediaQuery.of(context).size.width;
    final currentHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Center(
        child: Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: currentWidth * 0.25),
          child: ScrollConfiguration(
            behavior:
                ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  //Navbar

                  const DesktopNavbar(),

                  SizedBox(
                    height: currentHeight * 0.1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

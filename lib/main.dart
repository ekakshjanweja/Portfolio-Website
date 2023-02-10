import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_website/constants/app_colors.dart';
import 'package:portfolio_website/screens/home_page.dart';

void main() => runApp(
      const MyApp(),
    );

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Random Number Generator

    var randomNumber = Random().nextInt(7);
    var randomHeight = Random().nextInt(8);

    //Material App
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'STORMEJ',
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: HomePage(
        randomNumber: randomNumber,
        randomHeight: randomHeight,
      ),
    );
  }
}

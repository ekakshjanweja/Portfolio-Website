import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  TimeOfDay now = TimeOfDay.now();
  bool isDay = now.hour > 18 || now.hour < 6 ? false : true;

  return isDay ? ThemeMode.light : ThemeMode.dark;
});

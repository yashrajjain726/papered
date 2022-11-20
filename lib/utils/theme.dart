import 'package:flutter/material.dart';

class ThemeUtils {
  static Color accentColor = Colors.amber;

  static setAccentColor(Color accent) {
    accentColor = accent;
  }

  static const accent = Colors.amber;
  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    canvasColor: Colors.white,
    primaryColor: Colors.white,
    colorScheme: const ColorScheme.light().copyWith(secondary: Colors.amber),
  );

  static final darkTheme = ThemeData(
      scaffoldBackgroundColor: Colors.black87,
      canvasColor: Colors.black87,
      colorScheme: const ColorScheme.dark().copyWith(secondary: Colors.amber));
}

import 'package:flutter/material.dart';
import 'package:uolia_app/app/themes/text_theme.dart';

/// Light theme
class LightTheme {
  /// ThemeData for Light theme
  static ThemeData data = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF2672E),
      primary: const Color(0xFFF2672E),
      onPrimary: Colors.white,
      background: const Color(0xFFEEEEEE),
    ),
    textTheme: textTheme,
  ).copyWith(
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      actionsIconTheme: IconThemeData(
        color: Color(0xff555555),
      ),
      foregroundColor: Colors.black,
    ),
  );
}

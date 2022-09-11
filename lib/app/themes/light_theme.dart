import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Light theme
class LightTheme {
  /// ThemeData for Light theme
  static ThemeData data = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF2672E),
      primary: const Color(0xFFF2672E),
      onPrimary: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyText1: GoogleFonts.poppinsTextTheme().bodyText1!.copyWith(
            color: Colors.black,
          ),
      bodyText2: GoogleFonts.poppinsTextTheme().bodyText2!.copyWith(
            color: Colors.black,
          ),
    ),
  );
}

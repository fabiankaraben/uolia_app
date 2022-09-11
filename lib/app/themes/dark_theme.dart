import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Dark theme
class DarkTheme {
  /// ThemeData for Dark theme
  static ThemeData data = ThemeData.from(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFFF2672E),
      brightness: Brightness.dark,
      background: const Color(0xFF121212),
      primary: const Color(0xFFF2672E),
      onPrimary: Colors.white,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      bodyText1: GoogleFonts.poppinsTextTheme().bodyText1!.copyWith(
            color: Colors.white,
          ),
      bodyText2: GoogleFonts.poppinsTextTheme().bodyText2!.copyWith(
            color: Colors.white,
          ),
      button: GoogleFonts.poppinsTextTheme().button!.copyWith(
            color: Colors.white,
          ),
    ),
    // ).copyWith(
    //   textButtonTheme: TextButtonThemeData(
    //     style: ButtonStyle(
    //       textStyle: MaterialStateProperty.resolveWith(
    //         (states) => const TextStyle(fontSize: 44),
    //       ),
    //     ),
    //   ),
  );
}

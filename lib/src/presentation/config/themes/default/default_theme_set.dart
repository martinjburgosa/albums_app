import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../application/common/customs/customer_theme.dart';
import '../../../common/values/color_set.dart';
import '../theme_set.dart';

class DefaultThemeSet extends ThemeSet {
  DefaultThemeSet()
      : super(
          name: 'default',
          themes: [
            CustomerTheme(
              logoPath: 'assets/img/logo.png',
              theme: _defaultTheme,
            )
          ],
        );
}

const Color _defaultRed = Color.fromRGBO(229, 9, 21, 1);
const Color _defaultRedDark = Color.fromRGBO(125, 12, 17, 1);
const Color _greyAccent = Color(0xFF565E71);
const Color _greyAccentLight = Color(0xFF7F868C);

/// Default theme
final ThemeData _defaultTheme = ThemeData(
  primaryColor: _defaultRed,
  primaryColorDark: _defaultRedDark,
  colorScheme: ColorScheme.fromSwatch(accentColor: _greyAccent),
  highlightColor: Colors.white,
  indicatorColor: _greyAccentLight,
  textTheme: TextTheme(
    displayLarge: GoogleFonts.montserrat(
      fontSize: 96.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -1.5,
    ),
    displayMedium: GoogleFonts.montserrat(
      fontSize: 60.0,
      fontWeight: FontWeight.w300,
      letterSpacing: -0.5,
      color: ColorSet.blackGradient90.value,
    ),
    displaySmall: GoogleFonts.montserrat(
      fontSize: 48.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      color: ColorSet.blackGradient60.value,
    ),
    headlineMedium: GoogleFonts.montserrat(
      fontSize: 34.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      color: ColorSet.blackGradient90.value,
    ),
    headlineSmall: GoogleFonts.montserrat(
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.0,
      color: ColorSet.blackGradient60.value,
    ),
    // Text to appbar title
    titleLarge: GoogleFonts.montserrat(
      fontSize: 18.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      color: Colors.white,
    ),
    titleMedium: GoogleFonts.montserrat(
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.15,
      color: ColorSet.blackGradient87.value,
    ),
    titleSmall: GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      color: ColorSet.blackGradient60.value,
    ),
    // Text with emphasis (Titles)
    bodyLarge: GoogleFonts.montserrat(
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      color: Colors.black87,
    ),
    // Default text
    bodyMedium: GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
    ),
    labelLarge: GoogleFonts.montserrat(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      letterSpacing: 1.25,
    ),
    labelSmall: GoogleFonts.montserrat(
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 1.5,
      color: ColorSet.blackGradient60.value,
    ),
    bodySmall: GoogleFonts.montserrat(
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      color: ColorSet.blackGradient90.value,
    ),
  ),
  dialogBackgroundColor: Colors.white,
  dialogTheme: const DialogTheme(
    backgroundColor: Colors.white,
    elevation: 12.0,
    shape: ContinuousRectangleBorder(),
  ),
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      foregroundColor: _greyAccent,
      side: BorderSide.none,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: Colors.white,
      backgroundColor: _greyAccent,
      elevation: 5,
      padding: const EdgeInsets.all(7.5),
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      overlayColor: WidgetStateProperty.all<Color?>(ColorSet.greyOpacity.value),
      foregroundColor: WidgetStateProperty.all<Color?>(_defaultRed),
    ),
  ),
  inputDecorationTheme: const InputDecorationTheme(
    focusColor: _greyAccent,
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _greyAccent,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        color: _greyAccent,
      ),
    ),
  ),
);

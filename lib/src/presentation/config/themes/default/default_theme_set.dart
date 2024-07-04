import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../application/common/customs/customer_theme.dart';
import '../theme_set.dart';

class DefaultThemeSet extends ThemeSet {
  DefaultThemeSet()
      : super(
          name: 'default',
          themes: [
            CustomerTheme(
              logoPath: 'assets/img/logo.png',
              theme: _defaultTheme(),
            )
          ],
        );
}

/// Default theme
ThemeData _defaultTheme() {
  const colorScheme = lightScheme;
  final displayTextTheme = GoogleFonts.getTextTheme('Roboto');
  final bodyTextTheme = GoogleFonts.getTextTheme('Noto Sans');

  final textTheme = displayTextTheme.copyWith(
    bodyLarge: bodyTextTheme.bodyLarge,
    bodyMedium: bodyTextTheme.bodyMedium,
    bodySmall: bodyTextTheme.bodySmall,
    labelLarge: bodyTextTheme.labelLarge,
    labelMedium: bodyTextTheme.labelMedium,
    labelSmall: bodyTextTheme.labelSmall,
  );

  return ThemeData(
    colorScheme: colorScheme,
    primaryColor: colorScheme.primary,
    brightness: colorScheme.brightness,
    scaffoldBackgroundColor: colorScheme.surface,
    textTheme: textTheme,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: WidgetStateProperty.all(colorScheme.secondary),
    ),
  );
}

const lightScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xff4c662b),
  surfaceTint: Color(0xff4c662b),
  onPrimary: Color(0xffffffff),
  primaryContainer: Color(0xffcdeda3),
  onPrimaryContainer: Color(0xff102000),
  secondary: Color(0xff586249),
  onSecondary: Color(0xffffffff),
  secondaryContainer: Color(0xffdce7c8),
  onSecondaryContainer: Color(0xff151e0b),
  tertiary: Color(0xff386663),
  onTertiary: Color(0xffffffff),
  tertiaryContainer: Color(0xffbcece7),
  onTertiaryContainer: Color(0xff00201e),
  error: Color(0xffba1a1a),
  onError: Color(0xffffffff),
  errorContainer: Color(0xffffdad6),
  onErrorContainer: Color(0xff410002),
  surface: Color(0xfff9faef),
  onSurface: Color(0xff1a1c16),
  onSurfaceVariant: Color(0xff44483d),
  outline: Color(0xff75796c),
  outlineVariant: Color(0xffc5c8ba),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff2f312a),
  inversePrimary: Color(0xffb1d18a),
  primaryFixed: Color(0xffcdeda3),
  onPrimaryFixed: Color(0xff102000),
  primaryFixedDim: Color(0xffb1d18a),
  onPrimaryFixedVariant: Color(0xff354e16),
  secondaryFixed: Color(0xffdce7c8),
  onSecondaryFixed: Color(0xff151e0b),
  secondaryFixedDim: Color(0xffbfcbad),
  onSecondaryFixedVariant: Color(0xff404a33),
  tertiaryFixed: Color(0xffbcece7),
  onTertiaryFixed: Color(0xff00201e),
  tertiaryFixedDim: Color(0xffa0d0cb),
  onTertiaryFixedVariant: Color(0xff1f4e4b),
  surfaceDim: Color(0xffdadbd0),
  surfaceBright: Color(0xfff9faef),
  surfaceContainerLowest: Color(0xffffffff),
  surfaceContainerLow: Color(0xfff3f4e9),
  surfaceContainer: Color(0xffeeefe3),
  surfaceContainerHigh: Color(0xffe8e9de),
  surfaceContainerHighest: Color(0xffe2e3d8),
);

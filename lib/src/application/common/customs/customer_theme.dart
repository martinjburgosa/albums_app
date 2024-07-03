import 'package:flutter/material.dart';

class CustomerTheme {
  const CustomerTheme({
    required this.theme,
    required this.logoPath,
    this.name = defaultThemeName,
  });

  static const String defaultThemeName = 'default';

  final String name;
  final ThemeData theme;
  final String logoPath;
}

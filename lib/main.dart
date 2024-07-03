import 'package:flutter/material.dart';

import 'src/presentation/albums_app.dart';
import 'src/presentation/config/themes/default/default_theme_set.dart';
import 'src/presentation/config/themes/theme_resolver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final defaultTheme =
      ThemeResolver(customer: 'default', themeSets: [DefaultThemeSet()])
          .resolve();

  runApp(AlbumsApp(initialTheme: defaultTheme));
}

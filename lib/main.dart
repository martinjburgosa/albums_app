import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/presentation/albums_app.dart';
import 'src/presentation/config/themes/default/default_theme_set.dart';
import 'src/presentation/config/themes/theme_resolver.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  final defaultTheme =
      ThemeResolver(customer: 'default', themeSets: [DefaultThemeSet()])
          .resolve();

  runApp(
    ProviderScope(
      child: AlbumsApp(initialTheme: defaultTheme),
    ),
  );
}

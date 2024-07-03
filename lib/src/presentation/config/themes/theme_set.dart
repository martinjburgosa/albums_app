import '../../../application/common/customs/customer_theme.dart';

class ThemeSet {
  ThemeSet({
    required this.name,
    required List<CustomerTheme> themes,
    this.defaultFormatName = CustomerTheme.defaultThemeName,
  }) : _themes = _toMap(themes, defaultFormatName);

  final String name;
  final Map<String, CustomerTheme> _themes;
  final String defaultFormatName;

  CustomerTheme get defaultTheme => getForFormat(defaultFormatName);

  CustomerTheme getForFormat(String formatName) {
    if (_themes.containsKey(formatName)) {
      return _themes[formatName]!;
    } else {
      throw ArgumentError.value(
        formatName,
        '$formatName does not exist in the $name theme set',
      );
    }
  }

  static Map<String, CustomerTheme> _toMap(
      List<CustomerTheme> themes, String defaultFormatName) {
    if (themes.isEmpty) {
      throw ArgumentError('The themes list should not be empty');
    }
    final themesMap =
        themes.asMap().map((key, value) => MapEntry(value.name, value));
    if (!themesMap.containsKey(defaultFormatName)) {
      throw ArgumentError(
          'One of your themes should match the provided default format name $defaultFormatName');
    } else {
      return themesMap;
    }
  }
}

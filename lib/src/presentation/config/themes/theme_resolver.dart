import '../../../application/common/customs/customer_theme.dart';
import 'theme_set.dart';

class ThemeResolver {
  ThemeResolver({
    required this.customer,
    required List<ThemeSet> themeSets,
  }) : _themeSetMap = _toMap(themeSets);
  final String customer;
  final Map<String, ThemeSet> _themeSetMap;

  CustomerTheme resolve([String? format]) {
    if (_themeSetMap.containsKey(customer)) {
      return _themeSetMap[customer]!
          .getForFormat(format ?? CustomerTheme.defaultThemeName);
    } else {
      throw ArgumentError(
          'The customer $customer does not have an associated theme set');
    }
  }

  static Map<String, ThemeSet> _toMap(List<ThemeSet> themeSets) {
    return themeSets.asMap().map((key, value) => MapEntry(value.name, value));
  }
}

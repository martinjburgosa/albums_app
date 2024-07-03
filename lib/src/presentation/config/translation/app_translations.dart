import 'package:get/get.dart';

import 'langs/en_us.dart';
import 'langs/es_co.dart';

/// A class to set up the translations of app's labels.
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'es_CO': esCo,
        'en_US': enUs,
      };
}

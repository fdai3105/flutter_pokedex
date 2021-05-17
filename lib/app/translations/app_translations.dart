import '../../app/translations/en_US/en_us_translations.dart';
import '../../app/translations/vi_VN/vi_vn_translations.dart';

class AppTranslation {
  AppTranslation._();

  static Map<String, Map<String, String>> translations = {
    'en': enUs,
    'vi': viVn,
  };
}

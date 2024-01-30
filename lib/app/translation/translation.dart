import '../locales/english_keys.dart';
import '../locales/khmer_keys.dart';

class AppTranslation {
  static Map<String, Map<String, String>> loadTranslateKeys() {
    return {
      "en_US": getEnglishKeys(),
      "km_KH": getKhmerKeys(),
    };
  }
}

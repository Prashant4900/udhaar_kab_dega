part of 'app_prefs.dart';

class AppPrefHelper {
  static Future<bool> setLoggedInState({required bool loggedIn}) async {
    return AppPref.save(AppPrefKey.loggedIn, loggedIn);
  }

  static Future<bool> clearLoggedInState() async {
    return AppPref.remove(AppPrefKey.loggedIn);
  }

  static bool getLoggedInState() {
    return AppPref.get(AppPrefKey.loggedIn, false) as bool;
  }

  static Future<bool> setLogoutState({required bool logout}) async {
    return AppPref.save(AppPrefKey.logout, logout);
  }

  static bool getLogoutState() {
    return AppPref.get(AppPrefKey.logout, true) as bool;
  }

  static Future<bool> setLanguage({required AppLocale locale}) async {
    return AppPref.save(AppPrefKey.language, locale.name);
  }

  static String getLanguage() {
    final lang = AppPref.get(AppPrefKey.language, AppLocale.en.name) as String;
    log('langlang: $lang');
    return lang;
  }
}

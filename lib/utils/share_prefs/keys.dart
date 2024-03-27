part of 'app_prefs.dart';

enum AppPrefKey {
  loggedIn('loggedIn'),
  language('language'),
  logout('logout');

  const AppPrefKey(this.name);
  final String name;
}

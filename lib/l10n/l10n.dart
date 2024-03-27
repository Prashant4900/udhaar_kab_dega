import 'package:flutter/material.dart';
import 'package:udhaar_kab_dega/gen/l10n/app_localizations.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('hi'),
  ];
}

enum AppLocale {
  en, // English
  hi, // Hindi
}

extension LocalizationStrings on BuildContext {
  AppLocalizations get local {
    return AppLocalizations.of(this)!;
  }
}

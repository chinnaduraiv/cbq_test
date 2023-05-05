import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:cbq/features/setting/language/appLocalizationsDelegate.dart';

class AppLocalizations {
  late Locale locale;
  late Map<String, String> valueText;

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      AppLocalizationsDelegate();

  Future loadTranslateFile() async {
    await rootBundle
        .loadString('assets/lang/${locale.languageCode}.json')
        .then((jsonValue) {
      Map<String, dynamic> json = jsonDecode(jsonValue);
      valueText = json.map((key, value) => MapEntry(key, value.toString()));
    });
  }

  String getTranslate(String key) {
    return valueText[key]!;
  }
}

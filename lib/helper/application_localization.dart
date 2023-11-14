// ignore_for_file: omit_local_variable_types

import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  // Helper method to keep the code in the widgets concise
  // Localizations are accessed using an InheritedWidget "of" syntax
  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
    
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();
  Map<String, String>? localizedStrings;

  Future<bool> load() async {
    // Load JSON file from the "language" folder

    String jsonString = await rootBundle
        .loadString('lib/assets/language/${locale.languageCode}_${locale.countryCode}.json');
    Map<String, dynamic> jsonLanguageMap = json.decode(jsonString);
    localizedStrings = jsonLanguageMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  // This method will be called from every widget which needs a localized text
  String translate(String key) {
    return localizedStrings![key]!;
  }

  /*Widget rotate(Widget child, {bool isUrdu = false}) {
    return RotatedBox(quarterTurns: isUrdu ? 2 : 4, child: child);
  }*/
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  // This delegate instance will never change (it doesn't even have fields!)
  // It can provide a constant constructor.
  const _AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    // Include all of your supported language codes here
    var isContain = [Locale('en', 'US'), Locale('en', 'CA')].contains(locale);
    return isContain;
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    // AppLocalizations class is where the JSON loading actually runs
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

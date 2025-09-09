import 'package:flutter/material.dart';

class LocaleProvider extends ChangeNotifier {
  String appLanguage = "en";

  void changeLocale(String newLanguage) {
    if (appLanguage == newLanguage) {
      return;
    }
    appLanguage = newLanguage;
    notifyListeners();
  }
}

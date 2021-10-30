import 'package:flutter/material.dart';

class AppConfigProvider extends ChangeNotifier {
  String appLanguage = 'en';
  ThemeMode appTheme = ThemeMode.light;

  bool isLightMode() {
    return appTheme == ThemeMode.light;
  }

  void changeTheme(ThemeMode mode) {
    if (mode == appTheme) return;
    appTheme = mode;
    notifyListeners();
  }

  void changeLanguage(String newLanguage) {
    if (appLanguage == newLanguage) return;
    appLanguage = newLanguage;
    notifyListeners();
  }

  String getSelectedLanguageText() {
    if (appLanguage == 'ar') {
      return 'العربيه';
    }
    return 'English';
  }
}

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/ui_library_export.dart';

class ThemeModel extends ChangeNotifier {
  /// Get Theme from SharedPreference.
  /// Default Theme is UThemes.dark.
  ThemeModel() {
    _loadFromPreferences();
  }

  ThemeData _themeData = UThemes.dark;

  ThemeData get getThemeData => _themeData;

  String get getThemeName {
    if (_themeData == UThemes.dark) {
      return 'dark';
    } else if (_themeData == UThemes.light) {
      return 'light';
    } else if (_themeData == UThemes.tbd) {
      return 'tbd';
    }
    return 'dark';
  }

  Future<void> _loadFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final _themeName = prefs.getString('themeName') ?? 'dark';
    setTheme(_themeName);
  }

  void setTheme(String themeName) async {
    if (themeName == 'dark') {
      _themeData = UThemes.dark;
    } else if (themeName == 'light') {
      _themeData = UThemes.light;
    } else if (themeName == 'tbd') {
      _themeData = UThemes.tbd;
    } else {
      _themeData = UThemes.dark;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('themeName', themeName);
    notifyListeners();
  }
}

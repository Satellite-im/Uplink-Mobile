import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/ui_library_export.dart';

const String _kThemeName = 'themeName';
const String _kDark = 'dark';

class ThemeModel extends ChangeNotifier {
  /// Get Theme from SharedPreference.
  /// Default Theme is [UThemes.dark].
  ThemeModel() {
    _loadFromPreferences();
  }

  ThemeData _themeData = UThemes.dark;

  ThemeData get getThemeData => _themeData;

  ThemeType get getThemeType {
    if (_themeData == UThemes.dark) {
      return ThemeType.dark;
    } else if (_themeData == UThemes.light) {
      return ThemeType.light;
    } else if (_themeData == UThemes.tbd) {
      return ThemeType.tbd;
    }
    return ThemeType.dark;
  }

  Future<void> _loadFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final _themeName = prefs.getString(_kThemeName) ?? _kDark;
    await setTheme(_themeName.toThemeType());
  }

  Future<void> setTheme(ThemeType themeType) async {
    if (themeType == ThemeType.dark) {
      _themeData = UThemes.dark;
    } else if (themeType == ThemeType.light) {
      _themeData = UThemes.light;
    } else if (themeType == ThemeType.tbd) {
      _themeData = UThemes.tbd;
    } else {
      _themeData = UThemes.dark;
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_kThemeName, themeType.toStrName());
    notifyListeners();
  }
}

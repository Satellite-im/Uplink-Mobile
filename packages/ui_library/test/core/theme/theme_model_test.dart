import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/core/core_export.dart';

void main() {
  group('SharedPreferences', () {
    test('return \'dark\'  when no theme name saved', () async {
      SharedPreferences.setMockInitialValues({});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final themeName = prefs.getString('themeName');

      expect(themeName, null);
    });

    test('return \'light\'  when light theme name saved', () async {
      SharedPreferences.setMockInitialValues({'themeName': 'light'});
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      final themeName = prefs.getString('themeName');

      expect(themeName, 'light');
    });
  });

  group('ThemeModel', () {
    ThemeModel themeModel;
    test('return dark theme when no theme saved', () async {
      themeModel = ThemeModel();
      expect(themeModel.getThemeName, 'dark');
      expect(themeModel.getThemeData, UThemes.dark);
    });
    test('get light theme when set theme name to \'light\'', () {
      themeModel = ThemeModel();
      themeModel.setTheme('light');

      expect(themeModel.getThemeData, UThemes.light);
    });

    test('get dark theme when theme name is unavailable', () {
      themeModel = ThemeModel();
      themeModel.setTheme('olalala');

      expect(themeModel.getThemeData, UThemes.dark);
    });
  });
}

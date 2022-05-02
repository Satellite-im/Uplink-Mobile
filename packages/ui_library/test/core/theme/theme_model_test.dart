import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_library/core/theme/theme_export.dart';

void main() {
  group('Unit Test SharedPreferences |', () {
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

  group('Unit Test ThemeModel |', () {
    ThemeModel themeModel;
    test('return dark theme when no theme saved', () async {
      themeModel = ThemeModel();
      expect(themeModel.getThemeType, ThemeType.dark);
      expect(themeModel.getThemeData, UThemes.dark);
    });
    test('get light theme when set theme name to \'light\'', () {
      themeModel = ThemeModel();
      themeModel.setTheme(ThemeType.light);

      expect(themeModel.getThemeData, UThemes.light);
    });
  });
}

enum ThemeType { dark, light, tbd }

extension StrParsing on ThemeType {
  String toStrName() {
    final String _themeName;
    switch (this) {
      case ThemeType.dark:
        _themeName = 'dark';
        break;
      case ThemeType.light:
        _themeName = 'light';
        break;
      case ThemeType.tbd:
        _themeName = 'tbd';
        break;
      default:
        _themeName = 'dark';
    }
    return _themeName;
  }
}

extension ThemeTypeParsing on String {
  ThemeType toThemeType() {
    final ThemeType _themeType;
    switch (this) {
      case 'dark':
        _themeType = ThemeType.dark;
        break;
      case 'light':
        _themeType = ThemeType.light;
        break;
      case 'tbd':
        _themeType = ThemeType.tbd;
        break;
      default:
        _themeType = ThemeType.dark;
    }
    return _themeType;
  }
}

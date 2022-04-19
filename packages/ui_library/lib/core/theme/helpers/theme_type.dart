enum ThemeType { dark, light, tbd }

const String _kDark = 'dark';
const String _kLight = 'light';
const String _kTbd = 'tbd';

extension StrParsing on ThemeType {
  String toStrName() {
    final String _themeName;
    switch (this) {
      case ThemeType.dark:
        _themeName = _kDark;
        break;
      case ThemeType.light:
        _themeName = _kLight;
        break;
      case ThemeType.tbd:
        _themeName = _kTbd;
        break;
      default:
        _themeName = _kDark;
    }
    return _themeName;
  }
}

extension ThemeTypeParsing on String {
  ThemeType toThemeType() {
    final ThemeType _themeType;
    switch (this) {
      case _kDark:
        _themeType = ThemeType.dark;
        break;
      case _kLight:
        _themeType = ThemeType.light;
        break;
      case _kTbd:
        _themeType = ThemeType.tbd;
        break;
      default:
        _themeType = ThemeType.dark;
    }
    return _themeType;
  }
}

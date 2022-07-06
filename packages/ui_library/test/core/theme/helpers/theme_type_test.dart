import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/theme/helpers/theme_type.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';

void main() {
  group('Unit Test ThemeType |', () {});

  test(
      'Should return correct name for Theme Type when extension toStrName is called',
      () {
    const _kDark = 'dark';
    const _kLight = 'light';
    const _kTbd = 'tbd';

    then('Dark Theme Type should be ${_kDark}',
        () => ThemeType.dark.toStrName().should.be(_kDark));

    expect(ThemeType.dark.toStrName(), _kDark);
    expect(ThemeType.light.toStrName(), _kLight);
    expect(ThemeType.tbd.toStrName(), _kTbd);
  });

  test('Should return correct Theme Type when extension toThemeType is called',
      () {
    const _kDark = 'dark';
    const _kLight = 'light';
    const _kTbd = 'tbd';

    expect(_kDark.toThemeType(), ThemeType.dark);
    expect(_kLight.toThemeType(), ThemeType.light);
    expect(_kTbd.toThemeType(), ThemeType.tbd);
  });
}

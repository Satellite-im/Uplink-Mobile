import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/theme/helpers/theme_type.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  group('Unit Test ThemeType |', () {});

  given(
      'Should return correct name for Theme Type when extension toStrName is called',
      () {
    const _kDark = 'dark';
    const _kLight = 'light';
    const _kTbd = 'tbd';
    then('Dark Theme Type should be ${_kDark}',
        () => ThemeType.dark.toStrName().should.be(_kDark),
        and: {
          'Light Theme Type should be ${_kLight}': () =>
              ThemeType.light.toStrName().should.be(_kLight),
          'Tbd Theme Type should be ${_kTbd}': () =>
              ThemeType.tbd.toStrName().should.be(_kTbd),
        });
  });
  given('Should return correct Theme Type when extension toThemeType is called',
      () {
    const _kDark = 'dark';
    const _kLight = 'light';
    const _kTbd = 'tbd';
    then('Dark Theme Type should be ${_kDark}',
        () => _kDark.toThemeType().should.be(ThemeType.dark),
        and: {
          'Light Theme Type should be ${_kLight}': () =>
              _kLight.toThemeType().should.be(ThemeType.light),
          'Tbd Theme Type should be ${_kTbd}': () =>
              _kTbd.toThemeType().should.be(ThemeType.tbd),
        });
  });
}

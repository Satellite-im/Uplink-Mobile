import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/theme/helpers/theme_type.dart';

void main() {
  group('Unit Test ThemeType |', () {});

  test('Should return correct sizes for Theme Type', () {
    const _kDark = 'dark';
    const _kLight = 'light';
    const _kTbd = 'tbd';

    expect(ThemeType.dark.name, _kDark);
    expect(ThemeType.light.name, _kLight);
    expect(ThemeType.tbd.name, _kTbd);
  });
}

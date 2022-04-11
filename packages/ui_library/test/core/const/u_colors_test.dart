import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  test('Test UColors class', () {
    const _bgDark = Color(0xFF0D0E16);
    const _fgDark = Color(0xFF232838);
    const _mdDark = Color(0xFF1A1E2E);
    const _ctaBlue = Color(0xFF205FFA);
    const _ctaDark = Color(0xFF31353D);

    expect(UColors.bgDark, _bgDark);
    expect(UColors.fgDark, _fgDark);
    expect(UColors.mdDark, _mdDark);
    expect(UColors.ctaBlue, _ctaBlue);
    expect(UColors.ctaDark, _ctaDark);
  });
}

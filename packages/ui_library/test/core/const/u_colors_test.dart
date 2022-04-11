import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  test('Test UColors class', () {
    const _backgroundDark = Color(0xFF0D0E16);
    const _foregroundDark = Color(0xFF232838);
    const _modalDark = Color(0xFF1A1E2E);
    const _ctablue = Color(0xFF205FFA);
    const _ctadark = Color(0xFF31353D);

    expect(UColors.backgroundDark, _backgroundDark);
    expect(UColors.foregroundDark, _foregroundDark);
    expect(UColors.modalDark, _modalDark);
    expect(UColors.ctablue, _ctablue);
    expect(UColors.ctadark, _ctadark);
  });
}

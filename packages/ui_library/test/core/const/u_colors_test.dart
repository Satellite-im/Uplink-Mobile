import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  test('Test UColors class', () {
    const _backgroundDark = Color(0xFF0D0E16);
    expect(UColors.backgroundDark, _backgroundDark);
    const _foregroundDark = Color(0xFF232838);
    expect(UColors.foregroundDark, _foregroundDark);
    const _modalDark = Color(0xFF1A1E2E);
    expect(UColors.modalDark, _modalDark);
    const _white = Color(0xFFEEF0F2);
    expect(UColors.white, _white);
    const _ctaBlue = Color(0xFF205FFA);
    expect(UColors.ctaBlue, _ctaBlue);
    const _ctaDark = Color(0xFF31353D);
    expect(UColors.ctaDark, _ctaDark);
    const _onlineGreen = Color(0xFF00B894);
    expect(UColors.onlineGreen, _onlineGreen);
    const _idleYellow = Color(0xFFFECA57);
    expect(UColors.idleYellow, _idleYellow);
    const _termRed = Color(0xFFF93854);
    expect(UColors.termRed, _termRed);
    const _defGrey = Color(0xFF576574);
    expect(UColors.defGrey, _defGrey);
    const _textMed = Color(0xFFA8AABE);
    expect(UColors.textMed, _textMed);
    const _textDark = Color(0xFF6F748A);
    expect(UColors.textDark, _textDark);
  });
}

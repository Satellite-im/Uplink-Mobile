import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('UColors Class - Color\'s HEX number', () {
    const _backgroundDark = Color(0xFF0D0E16);
    const _foregroundDark = Color(0xFF232838);
    const _modalDark = Color(0xFF1A1E2E);
    const _white = Color(0xFFEEF0F2);
    const _ctaBlue = Color(0xFF205FFA);
    const _ctaDark = Color(0xFF31353D);
    const _onlineGreen = Color(0xFF00B894);
    const _idleYellow = Color(0xFFFECA57);
    const _termRed = Color(0xFFF93854);
    const _defGrey = Color(0xFF576574);
    const _textMed = Color(0xFFA8AABE);
    const _textDark = Color(0xFF6F748A);

    then('backgroundDark should return correct color',
        () => UColors.backgroundDark.should.be(_backgroundDark),
        and: {
          'foregroundDark should return correct color': () =>
              UColors.foregroundDark.should.be(_foregroundDark),
          'modalDark should return correct color': () =>
              UColors.modalDark.should.be(_modalDark),
          'white should return correct color': () =>
              UColors.white.should.be(_white),
          'ctaBlue should return correct color': () =>
              UColors.ctaBlue.should.be(_ctaBlue),
          'ctaDark should return correct color': () =>
              UColors.ctaDark.should.be(_ctaDark),
          'onlineGreen should return correct color': () =>
              UColors.onlineGreen.should.be(_onlineGreen),
          'idleYellow should return correct color': () =>
              UColors.idleYellow.should.be(_idleYellow),
          'termRed should return correct color': () =>
              UColors.termRed.should.be(_termRed),
          'defGrey should return correct color': () =>
              UColors.defGrey.should.be(_defGrey),
          'textMed should return correct color': () =>
              UColors.textMed.should.be(_textMed),
          'textDark should return correct color': () =>
              UColors.textDark.should.be(_textDark),
        });
  });
}

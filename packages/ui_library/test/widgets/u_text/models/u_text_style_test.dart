import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';
import 'package:ui_library/widgets/widgets_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('H1_primaryHeader UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'H1_primaryHeader fontFamily style should be correct': () =>
              UTextStyle.H1_primaryHeader.style.fontFamily.should
                  .be('SpaceMono'),
          'H1_primaryHeader fontSize style should be correct': () =>
              UTextStyle.H1_primaryHeader.style.fontSize.should.be(18.0),
          'H1_primaryHeader fontWeight style should be correct': () =>
              UTextStyle.H1_primaryHeader.style.fontWeight.should
                  .be(FontWeight.w700),
          'H1_primaryHeader style should be correct': () => UTextStyle
              .H1_primaryHeader.style.fontStyle.should
              .be(FontStyle.normal),
          'H1_primaryHeader color style should be correct': () => UTextStyle
              .H1_primaryHeader.style.color.should
              .be(UColors.textMed),
        });
  });
  given('H2_secondaryHeader UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'H2_secondaryHeader fontFamily should be correct': () => UTextStyle
              .H2_secondaryHeader.style.fontFamily.should
              .be('Poppins'),
          'H2_secondaryHeader fontSize should be correct': () =>
              UTextStyle.H2_secondaryHeader.style.fontSize.should.be(14.0),
          'H2_secondaryHeader fontWeight should be correct': () => UTextStyle
              .H2_secondaryHeader.style.fontWeight.should
              .be(FontWeight.w600),
          'H2_secondaryHeader  FontStyle should be correct': () => UTextStyle
              .H2_secondaryHeader.style.fontStyle.should
              .be(FontStyle.normal),
          'H2_secondaryHeader color should be correct': () => UTextStyle
              .H2_secondaryHeader.style.color.should
              .be(UColors.white),
        });
  });
  given('H3_tertiaryHeader UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'H3_tertiaryHeader fontFamily should be correct': () => UTextStyle
              .H3_tertiaryHeader.style.fontFamily.should
              .be('SpaceMono'),
          'H3_tertiaryHeader fontSize should be correct': () =>
              UTextStyle.H3_tertiaryHeader.style.fontSize.should.be(13.0),
          'H3_tertiaryHeader fontWeight should be correct': () => UTextStyle
              .H3_tertiaryHeader.style.fontWeight.should
              .be(FontWeight.w700),
          'H3_tertiaryHeader  FontStyle should be correct': () => UTextStyle
              .H3_tertiaryHeader.style.fontStyle.should
              .be(FontStyle.normal),
          'H3_tertiaryHeader color should be correct': () => UTextStyle
              .H3_tertiaryHeader.style.color.should
              .be(UColors.textMed),
        });
  });
  given('H4_fourthHeader UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'H4_fourthHeader fontFamily should be correct': () => UTextStyle
              .H4_fourthHeader.style.fontFamily.should
              .be('SpaceMono'),
          'H4_fourthHeader fontSize should be correct': () =>
              UTextStyle.H4_fourthHeader.style.fontSize.should.be(13.0),
          'H4_fourthHeader fontWeight should be correct': () => UTextStyle
              .H4_fourthHeader.style.fontWeight.should
              .be(FontWeight.w700),
          'H4_fourthHeader  FontStyle should be correct': () => UTextStyle
              .H4_fourthHeader.style.fontStyle.should
              .be(FontStyle.normal),
          'H4_fourthHeader color should be correct': () =>
              UTextStyle.H4_fourthHeader.style.color.should.be(UColors.white),
        });
  });
  given('H5_fifthHeader UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'H5_fifthHeader fontFamily should be correct': () =>
              UTextStyle.H5_fifthHeader.style.fontFamily.should.be('Poppins'),
          'H5_fifthHeader fontSize should be correct': () =>
              UTextStyle.H5_fifthHeader.style.fontSize.should.be(12.0),
          'H5_fifthHeader fontWeight should be correct': () => UTextStyle
              .H5_fifthHeader.style.fontWeight.should
              .be(FontWeight.w400),
          'H5_fifthHeader  FontStyle should be correct': () => UTextStyle
              .H5_fifthHeader.style.fontStyle.should
              .be(FontStyle.normal),
          'H5_fifthHeader color should be correct': () =>
              UTextStyle.H5_fifthHeader.style.color.should.be(UColors.textMed),
        });
  });
  given('B1_body UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'B1_body fontFamily should be correct': () =>
              UTextStyle.B1_body.style.fontFamily.should.be('Poppins'),
          'B1_body fontSize should be correct': () =>
              UTextStyle.B1_body.style.fontSize.should.be(12.0),
          'B1_body fontWeight should be correct': () =>
              UTextStyle.B1_body.style.fontWeight.should.be(FontWeight.w400),
          'B1_body  FontStyle should be correct': () =>
              UTextStyle.B1_body.style.fontStyle.should.be(FontStyle.normal),
          'B1_body color should be correct': () =>
              UTextStyle.B1_body.style.color.should.be(UColors.white),
        });
  });
  given('B2_medium UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'B2_medium fontFamily should be correct': () =>
              UTextStyle.B2_medium.style.fontFamily.should.be('Poppins'),
          'B2_medium fontSize should be correct': () =>
              UTextStyle.B2_medium.style.fontSize.should.be(12.0),
          'B2_medium fontWeight should be correct': () =>
              UTextStyle.B2_medium.style.fontWeight.should.be(FontWeight.w500),
          'B2_medium  FontStyle should be correct': () =>
              UTextStyle.B2_medium.style.fontStyle.should.be(FontStyle.normal),
          'B2_medium color should be correct': () =>
              UTextStyle.B2_medium.style.color.should.be(UColors.white),
        });
  });
  given('B3_bold UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'B3_bold fontFamily should be correct': () =>
              UTextStyle.B3_bold.style.fontFamily.should.be('Poppins'),
          'B3_bold fontSize should be correct': () =>
              UTextStyle.B3_bold.style.fontSize.should.be(12.0),
          'B3_bold fontWeight should be correct': () =>
              UTextStyle.B3_bold.style.fontWeight.should.be(FontWeight.w700),
          'B3_bold  FontStyle should be correct': () =>
              UTextStyle.B3_bold.style.fontStyle.should.be(FontStyle.normal),
          'B3_bold color should be correct': () =>
              UTextStyle.B3_bold.style.color.should.be(UColors.white),
        });
  });
  given('B4_italics UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'B4_italics fontFamily should be correct': () =>
              UTextStyle.B4_italics.style.fontFamily.should.be('Poppins'),
          'B4_italics fontSize should be correct': () =>
              UTextStyle.B4_italics.style.fontSize.should.be(12.0),
          'B4_italics fontWeight should be correct': () =>
              UTextStyle.B4_italics.style.fontWeight.should.be(FontWeight.w400),
          'B4_italics  FontStyle should be correct': () =>
              UTextStyle.B4_italics.style.fontStyle.should.be(FontStyle.italic),
          'B4_italics color should be correct': () =>
              UTextStyle.B4_italics.style.color.should.be(UColors.white),
        });
  });
  given('M1_micro UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'M1_micro fontFamily should be correct': () =>
              UTextStyle.M1_micro.style.fontFamily.should.be('Poppins'),
          'M1_micro fontSize should be correct': () =>
              UTextStyle.M1_micro.style.fontSize.should.be(10.0),
          'M1_micro fontWeight should be correct': () =>
              UTextStyle.M1_micro.style.fontWeight.should.be(FontWeight.w400),
          'M1_micro  FontStyle should be correct': () =>
              UTextStyle.M1_micro.style.fontStyle.should.be(FontStyle.normal),
          'M1_micro color should be correct': () =>
              UTextStyle.M1_micro.style.color.should.be(UColors.textDark),
        });
  });
  given('BUT1_primaryButton UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'BUT1_primaryButton fontFamily should be correct': () => UTextStyle
              .BUT1_primaryButton.style.fontFamily.should
              .be('Poppins'),
          'BUT1_primaryButton fontSize should be correct': () =>
              UTextStyle.BUT1_primaryButton.style.fontSize.should.be(12.0),
          'BUT1_primaryButton fontWeight should be correct': () => UTextStyle
              .BUT1_primaryButton.style.fontWeight.should
              .be(FontWeight.w400),
          'BUT1_primaryButton  FontStyle should be correct': () => UTextStyle
              .BUT1_primaryButton.style.fontStyle.should
              .be(FontStyle.normal),
          'BUT1_primaryButton color should be correct': () => UTextStyle
              .BUT1_primaryButton.style.color.should
              .be(UColors.white),
        });
  });
  given('BUT2_secondaryButton UTextStyles - text style\'s values', () {
    then('Number of text styles should be 12',
        () => UTextStyle.values.length.should.be(12),
        and: {
          'BUT2_secondaryButton fontFamily should be correct': () => UTextStyle
              .BUT2_secondaryButton.style.fontFamily.should
              .be('Poppins'),
          'BUT2_secondaryButton fontSize should be correct': () =>
              UTextStyle.BUT2_secondaryButton.style.fontSize.should.be(12.0),
          'BUT2_secondaryButton fontWeight should be correct': () => UTextStyle
              .BUT2_secondaryButton.style.fontWeight.should
              .be(FontWeight.w500),
          'BUT2_secondaryButton  FontStyle should be correct': () => UTextStyle
              .BUT2_secondaryButton.style.fontStyle.should
              .be(FontStyle.normal),
          'BUT2_secondaryButton color should be correct': () => UTextStyle
              .BUT2_secondaryButton.style.color.should
              .be(UColors.ctaBlue),
        });
  });
}

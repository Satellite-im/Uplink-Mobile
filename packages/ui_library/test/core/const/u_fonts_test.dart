import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  test('Test the fonts on UFonts class', () {
    const _iconsFont = 'UIcons';
    expect(UFonts.iconsFont, _iconsFont);

    const _textPoppinsFont = 'Poppins';
    const _textSpaceMonoFont = 'SpaceMono';
    expect(UFonts.textPoppinsFont, _textPoppinsFont);
    expect(UFonts.textSpaceMonoFont, _textSpaceMonoFont);
  });
}

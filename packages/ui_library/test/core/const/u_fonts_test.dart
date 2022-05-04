import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  group('Unit Test UFonts class |', () {
    test('Should return the correct Icon font', () {
      const _iconsFont = 'UIcons';
      expect(UFonts.iconsFont, _iconsFont);
    });

    test('Should return the correct text fonts', () {
      const _textPoppinsFont = 'Poppins';
      const _textSpaceMonoFont = 'SpaceMono';
      expect(UFonts.textPoppinsFont, _textPoppinsFont);
      expect(UFonts.textSpaceMonoFont, _textSpaceMonoFont);
    });
  });
}

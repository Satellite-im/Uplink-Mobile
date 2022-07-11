import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('Default arguments', () {
    const _iconsFont = 'UIcons';
    const _textPoppinsFont = 'Poppins';
    const _textSpaceMonoFont = 'SpaceMono';

    then('Icon Font should be UICons',
        () => UFonts.iconsFont.should.be(_iconsFont),
        and: {
          'Poppins Font should be Poppins': () =>
              UFonts.textPoppinsFont.should.be(_textPoppinsFont),
          'Space Mono Font should be Space Mono': () =>
              UFonts.textSpaceMonoFont.should.be(_textSpaceMonoFont),
        });
  });
}

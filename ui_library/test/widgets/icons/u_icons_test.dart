import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/all.dart';
import 'package:ui_library/widgets/all.dart';

void main() {
  const _kFontFam = 'UIcons';
  const String? _kFontPkg = null;
  test('Test all UIcons', () {
    const aboutIcon = UIcons.about_icon;

    expect(
      aboutIcon,
      const UIconData(0xe800, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );
  });
}

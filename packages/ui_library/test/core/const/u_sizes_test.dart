import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  test('Test the values on USizes class', () {
    const _iconSize = 24.0;
    expect(USizes.iconSize, _iconSize);

    const _textTopMenuBarTitleSize = 18.0;
    const _textPrimaryHeaderSize = 10.0;
    const _textSecondaryHeaderSize = 12.0;
    const _textTertiaryHeaderSize = 14.0;
    const _textBodySize = 10.0;
    const _textMediumSize = 10.0;
    const _textItalicsSize = 10.0;
    const _textBoldSize = 10.0;
    const _textMicroSize = 9.0;
    const _textPrimaryButtonSize = 10.0;
    const _textSecondaryButtonSize = 10.0;
    expect(USizes.textTopMenuBarTitleSize, _textTopMenuBarTitleSize);
    expect(USizes.textPrimaryHeaderSize, _textPrimaryHeaderSize);
    expect(USizes.textSecondaryHeaderSize, _textSecondaryHeaderSize);
    expect(USizes.textTertiaryHeaderSize, _textTertiaryHeaderSize);
    expect(USizes.textBodySize, _textBodySize);
    expect(USizes.textMediumSize, _textMediumSize);
    expect(USizes.textItalicsSize, _textItalicsSize);
    expect(USizes.textBoldSize, _textBoldSize);
    expect(USizes.textMicroSize, _textMicroSize);
    expect(USizes.textPrimaryButtonSize, _textPrimaryButtonSize);
    expect(USizes.textSecondaryButtonSize, _textSecondaryButtonSize);
  });
}

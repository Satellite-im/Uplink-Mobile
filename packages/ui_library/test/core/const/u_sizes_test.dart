import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/core/const/const_export.dart';

void main() {
  test('Test USizes class', () {
    const _iconSize = 24.0;

    expect(
      USizes.iconSize,
      _iconSize,
    );
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('Unit Test UUserProfileSizes |', () {});

  test('Should return correct sizes for User Profiles Widgets', () {
    const _largeSize = 56;
    const _normalSize = 40;
    const _topMenuBarSize = 30;

    expect(UUserProfileSize.large.size, _largeSize);
    expect(UUserProfileSize.normal.size, _normalSize);
    expect(UUserProfileSize.topMenuBar.size, _topMenuBarSize);
  });
}

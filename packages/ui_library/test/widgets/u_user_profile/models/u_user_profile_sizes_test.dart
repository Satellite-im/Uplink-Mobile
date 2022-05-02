import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('UUserProfileSizes |', () {});

  test('Test the sizes for User Profiles Widgets', () {
    const _largeSize = 56;
    const _normalSize = 40;
    const _topMenuBarSize = 30;

    expect(UUserProfileSize.large, _largeSize);
    expect(UUserProfileSize.normal, _normalSize);
    expect(UUserProfileSize.topMenuBar, _topMenuBarSize);
  });
}

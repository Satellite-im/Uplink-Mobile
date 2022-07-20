import 'package:ui_library/ui_library_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('UUserProfileSizes Class - Widget profile\'s sizes', () {
    const _largeSize = 56;
    const _normalSize = 40;
    const _topMenuBarSize = 30;

    then('Large size should be $_largeSize',
        () => UUserProfileSize.large.size.should.be(_largeSize),
        and: {
          'Normal size should be $_normalSize': () =>
              UUserProfileSize.normal.size.should.be(_normalSize),
          'Top menu bar should be $_topMenuBarSize': () =>
              UUserProfileSize.topMenuBar.size.should.be(_topMenuBarSize),
        });
  });
}

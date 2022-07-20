import 'package:ui_library/widgets/u_avatars_profile/models/u_avatar_profile_sizes.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('UAvatarProfileSizes Class - Widget profile\'s sizes', () {
    const _largeSize = 56;
    const _normalSize = 40;

    then('Large size should be $_largeSize',
        () => UAvatarProfileSize.large.size.should.be(_largeSize),
        and: {
          'Normal size should be $_normalSize': () =>
              UAvatarProfileSize.normal.size.should.be(_normalSize),
        });
  });
}

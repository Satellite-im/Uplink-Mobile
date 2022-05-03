import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/widgets/u_avatars_profile/models/u_avatar_profile_sizes.dart';

void main() {
  group('Unit Test UAvatarProfileSizes |', () {});

  test('Should return correct sizes for Avatar Profiles Widgets', () {
    const _largeSize = 56;
    const _normalSize = 40;

    expect(UAvatarProfileSize.large.size, _largeSize);
    expect(UAvatarProfileSize.normal.size, _normalSize);
  });
}

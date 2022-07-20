import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

//data sample for add friend pages
//friend's friendRequestSent is always false
MockContact blockedUserWithFriendRequest = MockContact(
  name: 'username',
  status: Status.online,
  imageAddress: 'packages/ui_library/images/placeholders/user_avatar_3.png',
  statusMessage: 'Something something space station',
  relationship: Relationship.block,
  friendRequestSent: true,
);

MockContact blockedUserWithoutFriendRequest = MockContact(
  name: 'username',
  status: Status.online,
  imageAddress: 'packages/ui_library/images/placeholders/user_avatar_3.png',
  statusMessage: 'Something something space station',
  relationship: Relationship.block,
  friendRequestSent: false,
);

MockContact friendUser = MockContact(
  name: 'username',
  status: Status.online,
  imageAddress: 'packages/ui_library/images/placeholders/user_avatar_3.png',
  statusMessage: 'Something something space station',
  relationship: Relationship.friend,
);

MockContact userWithFriendRequest = MockContact(
  name: 'username',
  status: Status.online,
  imageAddress: 'packages/ui_library/images/placeholders/user_avatar_3.png',
  statusMessage: 'Something something space station',
  relationship: Relationship.none,
  friendRequestSent: true,
);

MockContact userWithoutFriendRequest = MockContact(
  name: 'username',
  status: Status.online,
  imageAddress: 'packages/ui_library/images/placeholders/user_avatar_3.png',
  statusMessage: 'Something something space station',
  relationship: Relationship.none,
  friendRequestSent: false,
);

MockContact userBlockedYou = MockContact(
  name: 'username',
  status: Status.offline,
  imageAddress: 'packages/ui_library/images/placeholders/user_avatar_3.png',
  statusMessage: 'Something something space station',
  isBlocked: true,
);

import 'package:ui_library/ui_library_export.dart';

class DTOFriendsMessages {
  UnreadMessagesUserProfileCard jsonToUnreadMessagesUserProfileCard(
    dynamic json,
  ) {
    return UnreadMessagesUserProfileCard(
      status: Status.online,
      username: 'username',
      unreadMessages: 0,
      uMessage: UMessage(
        message: 'Lorem ipsum dolor sit amet, consectetur '
            'adipiscing elit, sed do eiusmod tempor',
        arrivalMessageTime: DateTime(2022, 06, 22, 16, 19),
      ),
    );
  }
}

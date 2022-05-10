import 'package:alchemist/alchemist.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/ui_library_export.dart';

void main() {
  group('Widget Test UnreadMessagesUserProfileCard |', () {
    goldenTest(
      'Golden Test | Should return correct UnreadMessagesUserProfileCard specs |',
      fileName: 'u_unread_messages_user_profile_card',
      builder: () => GoldenTestGroup(
        children: [
          GoldenTestScenario(
            name:
                'Should return correct UnreadMessagesUserProfileCard format with 0 messages and long message',
            child: UnreadMessagesUserProfileCard(
              username: 'usernamelonger',
              status: Status.offline,
              uMessage: UMessage(
                message:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                arrivalMessageTime: DateTime(2022, 05, 10, 22, 30),
              ),
              unreadMessages: 0,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UnreadMessagesUserProfileCard format with 1 message, long username and long message',
            child: UnreadMessagesUserProfileCard(
              username: 'usernamelongerverylongveryverylong',
              status: Status.online,
              uMessage: UMessage(
                message:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                arrivalMessageTime: DateTime(2022, 05, 10, 09, 30),
              ),
              unreadMessages: 1,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UnreadMessagesUserProfileCard format with 10 messages',
            child: UnreadMessagesUserProfileCard(
              username: 'usernamelonger',
              status: Status.online,
              uMessage: UMessage(
                message: 'Lorem ipsum dolor sit amet',
                arrivalMessageTime: DateTime(2022, 05, 10, 04, 20),
              ),
              unreadMessages: 10,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UnreadMessagesUserProfileCard format with 100 messages',
            child: UnreadMessagesUserProfileCard(
              username: 'usernamelonger',
              status: Status.idle,
              uMessage: UMessage(
                message: 'Lorem ipsum dolor sit amet',
                arrivalMessageTime: DateTime(2022, 05, 10, 17, 30),
              ),
              unreadMessages: 100,
            ),
          ),
          GoldenTestScenario(
            name:
                'Should return correct UnreadMessagesUserProfileCard format with 1000 messages and long message',
            child: UnreadMessagesUserProfileCard(
              username: 'usernamelonger',
              status: Status.offline,
              uMessage: UMessage(
                message:
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
                arrivalMessageTime: DateTime(2022, 05, 10, 10, 30),
              ),
              unreadMessages: 1000,
            ),
          ),
        ],
      ),
    );
  });
}

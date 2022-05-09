part of '../u_user_profile_cards_page.dart';

class _UnreadMessagesUserProfileCardSession extends StatelessWidget {
  const _UnreadMessagesUserProfileCardSession({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox.square(
            dimension: 16,
          ),
          UText(
            'Unread Messages User Profile Card',
            textStyle: UTextStyle.H4_fourthHeader,
          ),
          SizedBox.square(
            dimension: 16,
          ),
          UnreadMessagesUserProfileCard(
            username: 'Satellite',
            status: Status.online,
            message:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
            unreadMessages: 1,
          ),
          SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.online,
            message: 'Lorem ipsum dolor sit amet',
            unreadMessages: 10,
          ),
          SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.online,
            message: 'Lorem ipsum dolor sit amet',
            unreadMessages: 100,
          ),
          SizedBox.square(
            dimension: 8,
          ),
          UnreadMessagesUserProfileCard(
            username: 'usernamelonger',
            status: Status.online,
            message: 'Lorem ipsum dolor sit amet',
            unreadMessages: 1000,
          ),
        ],
      ),
    );
  }
}

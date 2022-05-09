part of '../u_user_profile_cards_page.dart';

class _NavDrawerUserProfileCard extends StatelessWidget {
  const _NavDrawerUserProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox.square(
          dimension: 16,
        ),
        const UText(
          'Nav Drawer User Profile Card',
          textStyle: UTextStyle.H4_fourthHeader,
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            UNavDrawerUserProfileCard(
              username: 'Satellite',
              status: Status.online,
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
            ),
            SizedBox.square(dimension: 8),
            UNavDrawerUserProfileCard(
              username: 'usernamelonger',
              status: Status.online,
              message: 'Lorem ipsum dolor sit amet',
            ),
          ],
        )
      ],
    );
  }
}

part of '../u_user_profile_cards_page.dart';

class _UserProfileCard extends StatelessWidget {
  const _UserProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: const [
        SizedBox.square(
          dimension: 16,
        ),
        UText(
          'User Profile Card',
          textStyle: UTextStyle.H4_fourthHeader,
        ),
        SizedBox.square(
          dimension: 16,
        ),
        UserProfileCard(
          username: 'longusernameeeeeeeeeeeeeeeeeeeeeee',
          status: Status.online,
          message:
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
        ),
        SizedBox.square(
          dimension: 16,
        ),
        UserProfileCard(
          username: 'username',
          status: Status.online,
          message: 'Lorem ipsum dolor sit amet, consectetur',
        ),
      ],
    );
  }
}

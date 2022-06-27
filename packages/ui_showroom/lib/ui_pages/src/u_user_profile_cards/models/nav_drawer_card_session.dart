part of '../u_user_profile_cards_page.dart';

class _NavDrawerUserProfileCard extends StatelessWidget {
  const _NavDrawerUserProfileCard({
    Key? key,
  }) : super(key: key);

  String _generateNewImage() {
    final _random = 1 + Random().nextInt(8);
    return 'packages/ui_library/images/placeholders/user_avatar_$_random.png';
  }

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
          children: [
            UNavDrawerUserProfileCard(
              username: 'longusernameeeeeeeeeeeeeeeeeeeeeee',
              status: Status.online,
              uImage: UImage(
                imagePath: _generateNewImage(),
                imageSource: ImageSource.local,
              ),
              message:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
            ),
            const SizedBox.square(dimension: 8),
            UNavDrawerUserProfileCard(
              username: 'username',
              status: Status.online,
              message: 'Lorem ipsum dolor sit amet',
              uImage: UImage(
                imagePath: _generateNewImage(),
                imageSource: ImageSource.local,
              ),
            ),
          ],
        )
      ],
    );
  }
}

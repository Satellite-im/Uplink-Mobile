part of '../u_user_profile_cards_page.dart';

class _UserProfileCard extends StatelessWidget {
  const _UserProfileCard({
    Key? key,
  }) : super(key: key);

  String _generateNewImage() {
    final _random = 1 + Random().nextInt(8);
    return 'packages/ui_library/images/placeholders/user_avatar_$_random.png';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox.square(
            dimension: 16,
          ),
          const UText(
            'User Profile Card',
            textStyle: UTextStyle.H4_fourthHeader,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          UUserProfileCard(
            username: 'longusernameeeeeeeeeeeeeeeeeeeeeee',
            status: Status.online,
            uImage: UImage(
              imagePath: _generateNewImage(),
              imageSource: ImageSource.local,
            ),
            message:
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore',
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          UUserProfileCard(
            username: 'username',
            status: Status.online,
            uImage: UImage(
              imagePath: _generateNewImage(),
              imageSource: ImageSource.local,
            ),
            message: 'Lorem ipsum dolor sit amet, consectetur',
          ),
        ],
      ),
    );
  }
}

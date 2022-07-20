part of '../chat_index_page.dart';

class _FavoritesFriends extends StatelessWidget {
  const _FavoritesFriends({
    Key? key,
    required this.favoritesFriendsList,
  }) : super(key: key);

  final List<MockContactsChat> favoritesFriendsList;

  @override
  Widget build(BuildContext context) {
    final _favoritesFriendsList = <Widget>[];

    for (final friend in favoritesFriendsList) {
      if (friend.unreadMessages > 0) {
        _favoritesFriendsList.add(
          UUserProfileNotification.withUsername(
            username: friend.username,
            uImage: UImage(
              imagePath: friend.imagePath,
              imageSource: ImageSource.local,
            ),
          ),
        );
      } else {
        _favoritesFriendsList.add(
          UUserProfile.withUsername(
            username: friend.username,
            uImage: UImage(
              imagePath: friend.imagePath,
              imageSource: ImageSource.local,
            ),
          ),
        );
      }
    }
    return Align(
      alignment: Alignment.topLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox.square(
            dimension: 17,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 16),
            child: UText(
              UAppStrings.chatIndexPage_favoritesTitle,
              textStyle: UTextStyle.H5_fifthHeader,
              textColor: UColors.textMed,
            ),
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          if (_favoritesFriendsList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: 63,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(4),
                      ),
                      onTap: () {
                        // TODO(Lucas): Add onTap later
                      },
                      child: _favoritesFriendsList[index],
                    );
                  },
                  separatorBuilder: (context, index) => const SizedBox.square(
                    dimension: 8,
                  ),
                  itemCount: _favoritesFriendsList.length,
                ),
              ),
            )
          else
            const _NewChatButton(),
        ],
      ),
    );
  }
}

class _NewChatButton extends StatelessWidget {
  const _NewChatButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 32),
      child: Column(
        children: [
          UIconButton.add(onPressed: () {}),
          const SizedBox.square(
            dimension: 8,
          ),
          const UText(
            UAppStrings.chatIndexPage_newChat,
            textStyle: UTextStyle.M1_micro,
            textColor: UColors.white,
          ),
        ],
      ),
    );
  }
}

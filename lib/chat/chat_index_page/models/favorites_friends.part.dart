part of '../chat_index_page.dart';

class _FavoritesFriends extends StatelessWidget {
  const _FavoritesFriends({
    Key? key,
    required this.favoritesFriendsList,
  }) : super(key: key);

  final List<UnreadMessagesUserProfileCard> favoritesFriendsList;

  @override
  Widget build(BuildContext context) {
    final _favoritesFriendsList = <Widget>[];

    for (final friend in favoritesFriendsList) {
      if (friend.unreadMessages > 0) {
        _favoritesFriendsList.add(
          UUserProfileNotification.withUsername(username: friend.username),
        );
      } else {
        _favoritesFriendsList.add(
          UUserProfile.withUsername(username: friend.username),
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
              'Favorites',
              textStyle: UTextStyle.H5_fifthHeader,
              textColor: UColors.textMed,
            ),
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          if (_favoritesFriendsList.isNotEmpty)
            SizedBox(
              height: 80,
              child: ListView.separated(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => _favoritesFriendsList[index],
                separatorBuilder: (context, index) => const SizedBox.square(
                  dimension: 8,
                ),
                itemCount: _favoritesFriendsList.length,
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
            'New Chat',
            textStyle: UTextStyle.M1_micro,
            textColor: UColors.white,
          ),
        ],
      ),
    );
  }
}

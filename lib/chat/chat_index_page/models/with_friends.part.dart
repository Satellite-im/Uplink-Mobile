part of '../chat_index_page.dart';

class _WithFriends extends StatelessWidget {
  const _WithFriends({
    Key? key,
    required this.friendsList,
  }) : super(key: key);

  final List<MockContactsChat> friendsList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final _friend = friendsList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: InkWell(
            borderRadius: const BorderRadius.all(
              Radius.circular(4),
            ),
            onTap: () {},
            onLongPress: () {
              UBottomSheetTwoButtons(
                context,
                userImage: UImage(
                  imagePath: _friend.imagePath,
                  imageSource: ImageSource.local,
                ),
                username: _friend.username,
                header: UAppStrings.chatIndexPage_whatToDoWIthChatBottomSheet,
                firstButtonText: UAppStrings.cancelButton,
                secondButtonText: UAppStrings.remove,
                firstButtonColor: UColors.ctaDark,
                secondButtonColor: UColors.termRed,
                firstButtonOnPressed: () => Navigator.of(
                  context,
                  rootNavigator: true,
                ).pop(),
                secondButtonOnPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
              ).show();
            },
            child: UnreadMessagesUserProfileCard(
              status: _friend.status,
              username: _friend.username,
              uMessage: _friend.uMessage,
              unreadMessages: _friend.unreadMessages,
              uImage: UImage(
                imagePath: _friend.imagePath,
                imageSource: ImageSource.local,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const SizedBox.square(
        dimension: 20,
      ),
      itemCount: friendsList.length,
    );
  }
}

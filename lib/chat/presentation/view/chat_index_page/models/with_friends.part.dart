part of '../chat_index_page.dart';

class _WithFriends extends StatelessWidget {
  const _WithFriends({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _chatController = GetIt.I.get<ChatBloc>();

    return BlocBuilder<ChatBloc, ChatState>(
      bloc: _chatController,
      builder: (context, state) {
        if ((state is AllChatsLoadSuccess || state is ChatLoadSucces) &&
            _chatController.allChatsWithUser.isNotEmpty) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              final _chatWithUser = _chatController.allChatsWithUser[index];
              final _user = _chatWithUser.userInChat;

              return InkWell(
                borderRadius: const BorderRadius.all(
                  Radius.circular(4),
                ),
                onTap: () {
                  Navigator.of(context, rootNavigator: true)
                      .push(
                        MaterialPageRoute<void>(
                          builder: (context) => ChatRoomPage(
                            user: _user,
                          ),
                        ),
                      )
                      .then<void>(
                        (value) =>
                            GetIt.I.get<FriendBloc>().closeWatchUserStream(),
                      );
                },
                onLongPress: () {
                  UBottomSheetTwoButtons(
                    context,
                    userImage: UImage(
                      imagePath: _user.profilePicture!.path,
                      imageSource: ImageSource.file,
                    ),
                    username: _user.username,
                    header:
                        UAppStrings.chatIndexPage_whatToDoWIthChatBottomSheet,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: UUnreadMessagesUserProfileCard(
                    status: _user.status ?? Status.offline,
                    username: _user.username,
                    uMessage: UMessage(
                      message: _chatWithUser.message,
                      arrivalMessageTime: _chatWithUser.messageSentTime,
                    ),
                    unreadMessages: 0,
                    uImage: UImage(
                      imagePath: _user.profilePicture?.path,
                      imageSource: ImageSource.file,
                    ),
                  ),
                ),
              );
            },
            itemCount: _chatController.allChatsWithUser.length,
          );
        }
        return const _WithoutFriendsYet();
      },
    );
  }
}

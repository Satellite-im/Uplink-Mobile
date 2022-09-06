part of '../chat_room_page.dart';

class UChatMessage extends StatelessWidget {
  const UChatMessage({
    Key? key,
    required this.chatMessage,
    required this.user,
    required this.currentUser,
    this.showCompleteMessage = true,
    this.hideProfilePicture = false,
  }) : super(key: key);

  final ChatMessage chatMessage;
  final User user;
  final CurrentUser currentUser;
  final bool showCompleteMessage;
  final bool hideProfilePicture;

  @override
  Widget build(BuildContext context) {
    final _sentMessage = chatMessage.chatMessageType == ChatMessageType.sent;
    return Padding(
      padding: showCompleteMessage
          ? _sentMessage
              ? const EdgeInsets.fromLTRB(0, 0, 16, 24)
              : const EdgeInsets.fromLTRB(16, 0, 0, 24)
          : _sentMessage
              ? const EdgeInsets.fromLTRB(0, 0, 16, 6)
              : const EdgeInsets.fromLTRB(16, 0, 0, 6),
      child: Column(
        crossAxisAlignment:
            _sentMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (_sentMessage)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: UColors.ctaBlue,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: UText(
                      chatMessage.message,
                      textStyle: UTextStyle.B1_body,
                    ),
                  ),
                ),
                const SizedBox.square(
                  dimension: 12,
                ),
                Center(
                  child: hideProfilePicture
                      ? const SizedBox.square(
                          dimension: 40,
                        )
                      : UUserProfile(
                          userProfileSize: UUserProfileSize.normal,
                          uImage: UImage(
                            imagePath: currentUser.profilePicture?.path,
                            fit: BoxFit.cover,
                            imageSource: ImageSource.file,
                          ),
                        ),
                ),
              ],
            )
          else
            Row(
              children: [
                Center(
                  child: hideProfilePicture
                      ? const SizedBox.square(
                          dimension: 40,
                        )
                      : UUserProfile(
                          userProfileSize: UUserProfileSize.normal,
                          uImage: UImage(
                            imagePath: user.profilePicture?.path,
                            fit: BoxFit.cover,
                            imageSource: ImageSource.file,
                          ),
                        ),
                ),
                const SizedBox.square(
                  dimension: 12,
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: UColors.foregroundDark,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: UText(
                      chatMessage.message,
                      textStyle: UTextStyle.B1_body,
                    ),
                  ),
                ),
              ],
            ),
          if (showCompleteMessage) ...[
            const SizedBox.square(
              dimension: 8,
            ),
            Padding(
              padding: _sentMessage
                  ? const EdgeInsets.only(right: 52)
                  : const EdgeInsets.only(left: 52),
              child: UText(
                DateFormatUtils.formatDateTwelveHours(
                  DateTime.now(),
                ),
                textStyle: UTextStyle.M1_micro,
              ),
            ),
          ]
        ],
      ),
    );
  }
}

part of '../chat_room_page.dart';

class MessageReceived extends StatelessWidget {
  const MessageReceived({
    Key? key,
    required this.messageReceived,
    required this.user,
    this.showCompleteMessage = true,
    this.hideProfilePicture = false,
  }) : super(key: key);

  final Message messageReceived;
  final User user;
  final bool showCompleteMessage;
  final bool hideProfilePicture;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: showCompleteMessage
          ? const EdgeInsets.fromLTRB(16, 0, 0, 24)
          : const EdgeInsets.fromLTRB(16, 0, 0, 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                    messageReceived.message,
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
              padding: const EdgeInsets.only(left: 52),
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

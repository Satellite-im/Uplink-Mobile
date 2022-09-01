part of '../chat_room_page.dart';

class MessageSent extends StatelessWidget {
  const MessageSent({
    Key? key,
    required this.messageSent,
    required this.currentUser,
  }) : super(key: key);

  final Message messageSent;
  final CurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
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
                    messageSent.message,
                    textStyle: UTextStyle.B1_body,
                  ),
                ),
              ),
              const SizedBox.square(
                dimension: 12,
              ),
              Center(
                child: UUserProfile(
                  userProfileSize: UUserProfileSize.normal,
                  uImage: UImage(
                    imagePath: currentUser.profilePicture?.path,
                    fit: BoxFit.cover,
                    imageSource: ImageSource.file,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 52),
            child: UText(
              DateFormatUtils.formatDateTwelveHours(
                DateTime.now(),
              ),
              textStyle: UTextStyle.M1_micro,
            ),
          ),
        ],
      ),
    );
  }
}

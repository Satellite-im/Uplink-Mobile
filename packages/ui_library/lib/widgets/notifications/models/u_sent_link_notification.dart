part of '../u_notification.dart';

enum ULinkNotificationType { withImage, withVideo, justText }

class _USentLinkNotification extends StatefulWidget {
  const _USentLinkNotification({
    Key? key,
    required this.uNotification,
    required this.uLinkNotificationType,
  }) : super(key: key);

  final UNotification uNotification;
  final ULinkNotificationType uLinkNotificationType;

  @override
  State<_USentLinkNotification> createState() => _USentLinkNotificationState();
}

class _USentLinkNotificationState extends State<_USentLinkNotification> {
  int _correctWidthToSubstractToLinkDescription(
      ULinkNotificationType _uLinkType) {
    if (_uLinkType == ULinkNotificationType.withImage) {
      return 68 + 16 + 8 + 48 + 12;
    } else if (_uLinkType == ULinkNotificationType.withVideo) {
      return 68 + 16 + 8 + 48 + 12 + 14;
    } else {
      return 68 + 16 + 8 + 8 + 12 + 14;
    }
  }

  @override
  Widget build(BuildContext context) {
    final _uLinkType = widget.uLinkNotificationType;

    final _screenSize = MediaQuery.of(context).size;
    final _widgetsWidthToSubstract =
        _correctWidthToSubstractToLinkDescription(_uLinkType);
    final _widthLinkDescription = _screenSize.width - _widgetsWidthToSubstract;
    return Column(
      children: [
        UNotificationCard(
          username: widget.uNotification.username,
          uMessage: UMessage(
            message: 'Sent you a link',
            arrivalMessageTime: widget.uNotification.arrivalNotificationTime,
          ),
          uImage: widget.uNotification._uImage,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(52, 8, 0, 0),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(
                color: UColors.foregroundDark,
              ),
              borderRadius: BorderRadius.circular(4),
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                top: 8,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox.square(
                    dimension: 8,
                  ),
                  if (_uLinkType == ULinkNotificationType.withImage)
                    SizedBox(
                      height: 40,
                      width: 40,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const UImage(
                          imagePath:
                              'packages/ui_library/images/placeholders/cover_photo_1.png',
                          imageSource: ImageSource.local,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else if (_uLinkType == ULinkNotificationType.withVideo)
                    SizedBox(
                      height: 40,
                      width: 54,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: const UImage(
                          imagePath:
                              'packages/ui_library/images/placeholders/cover_photo_1.png',
                          imageSource: ImageSource.local,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  const SizedBox.square(
                    dimension: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UText(
                        'Website Name',
                        textStyle: UTextStyle.H5_fifthHeader,
                      ),
                      const SizedBox.square(
                        dimension: 2,
                      ),
                      const UText(
                        'Page Title - Article Title',
                        textStyle: UTextStyle.B3_bold,
                        textColor: UColors.textMed,
                      ),
                      const SizedBox.square(
                        dimension: 1,
                      ),
                      SizedBox(
                        width: _widthLinkDescription,
                        child: const UText(
                          'Lorem ipsum dolor sit amet, consectetur assaas'
                          'Lorem ipsum dolor sit amet, consectetur',
                          textStyle: UTextStyle.B3_bold,
                          textOverflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

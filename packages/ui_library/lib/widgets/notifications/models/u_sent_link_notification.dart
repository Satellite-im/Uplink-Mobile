part of '../u_notification.dart';

class _USentMessageNotification extends StatefulWidget {
  /// Specific notification when receive a message or a link
  const _USentMessageNotification({
    Key? key,
    required this.uNotification,
  }) : super(key: key);

  final UNotification uNotification;

  @override
  State<_USentMessageNotification> createState() =>
      _USentMessageNotificationState();
}

class _USentMessageNotificationState extends State<_USentMessageNotification> {
  int _correctWidthToSubstractToLinkDescription(bool _isVideo) {
    if (!_isVideo) {
      return 68 + 50;
    } else {
      return 68 + 64;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: UFetchLinkData().fetch(widget.uNotification.message),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final _linkData = snapshot.data!;
            if (_linkData['isUrlValid'] == false) {
              return UNotificationCard(
                uNotification: UNotification(
                  isUnread: widget.uNotification.isUnread,
                  username: widget.uNotification.username,
                  arrivalNotificationTime:
                      widget.uNotification.arrivalNotificationTime,
                  notificationType: NotificationType.message,
                  message: ULibraryStrings.uNotification_sentYouAMessage,
                  uImage: widget.uNotification.uImage,
                ),
              );
            }

            final _isLinkWithVideo = _linkData['type']!.contains('video');
            final _linkImage = _linkData['image'];
            final _siteName = _linkData['siteName']!;
            final _title = _linkData['title']!;
            final _description = _linkData['description']!;

            final _widgetsWidthToSubstract =
                _correctWidthToSubstractToLinkDescription(_isLinkWithVideo);

            return LayoutBuilder(builder: (context, constraints) {
              final _widgetWidth = constraints.maxWidth;
              final _widthLinkDescription =
                  _widgetWidth - _widgetsWidthToSubstract;

              return SizedBox(
                height: USizes.uNotificationLinkHeightSize,
                child: Column(
                  children: [
                    UNotificationCard(
                      uNotification: UNotification(
                        isUnread: widget.uNotification.isUnread,
                        username: widget.uNotification.username,
                        arrivalNotificationTime:
                            widget.uNotification.arrivalNotificationTime,
                        notificationType: NotificationType.link,
                        message: ULibraryStrings.uNotification_sentYouALink,
                        uImage: widget.uNotification.uImage,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(52, 8, 0, 0),
                      child: Container(
                        height: USizes.uNotificationLinkBottomSideHeightSize,
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
                              SizedBox(
                                height: 40,
                                width: _isLinkWithVideo ? 54 : 40,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: Stack(
                                    fit: StackFit.expand,
                                    children: [
                                      UImage(
                                        imagePath: _linkImage,
                                        imageSource: ImageSource.network,
                                        fit: BoxFit.cover,
                                      ),
                                      if (_isLinkWithVideo)
                                        const Positioned(
                                          child: UIcon(
                                            UIcons.video_play,
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox.square(
                                dimension: 12,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  UText(
                                    _siteName,
                                    textStyle: UTextStyle.H5_fifthHeader,
                                  ),
                                  const SizedBox.square(
                                    dimension: 2,
                                  ),
                                  SizedBox(
                                    width: _widthLinkDescription,
                                    child: UText(
                                      _title,
                                      textStyle: UTextStyle.B3_bold,
                                      textColor: UColors.textMed,
                                      textOverflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                  ),
                                  const SizedBox.square(
                                    dimension: 1,
                                  ),
                                  SizedBox(
                                    width: _widthLinkDescription,
                                    child: UText(
                                      _description,
                                      textStyle: UTextStyle.B2_medium,
                                      textColor: UColors.white,
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
                ),
              );
            });
          } else {
            /// TODO(Lucas): Change the widget loader later
            return const UText(
              'Loading',
              textStyle: UTextStyle.H1_primaryHeader,
            );
          }
        });
  }
}

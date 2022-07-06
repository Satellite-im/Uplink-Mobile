part of '../u_notification.dart';

class _USentMessagekNotification extends StatefulWidget {
  /// Specific notification when receive a message or a link
  const _USentMessagekNotification({
    Key? key,
    required this.uNotification,
    required this.message,
  }) : super(key: key);

  final UNotification uNotification;
  final String message;

  @override
  State<_USentMessagekNotification> createState() =>
      _USentMessagekNotificationState();
}

class _USentMessagekNotificationState
    extends State<_USentMessagekNotification> {
  int _correctWidthToSubstractToLinkDescription(bool _isVideo) {
    if (!_isVideo) {
      return 68 + 16 + 8 + 48 + 12;
    } else {
      return 68 + 16 + 8 + 48 + 12 + 14;
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return FutureBuilder<Map<String, dynamic>>(
        future: UFetchLinkData().fetch(widget.message),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final _linkData = snapshot.data!;
            if (_linkData['isUrlValid'] == false) {
              return UNotificationCard(
                username: widget.uNotification.username,
                uMessage: UMessage(
                  message: ULibraryStrings.uNotification_sentYouAMessage,
                  arrivalMessageTime:
                      widget.uNotification.arrivalNotificationTime,
                ),
                uImage: widget.uNotification._uImage,
              );
            }

            final _isLinkWithVideo = _linkData['type']!.contains('video');
            final _linkImage = _linkData['image'];
            final _siteName = _linkData['siteName']!;
            final _title = _linkData['title']!;
            final _description = _linkData['description']!;

            final _widgetsWidthToSubstract =
                _correctWidthToSubstractToLinkDescription(_isLinkWithVideo);
            final _widthLinkDescription =
                _screenSize.width - _widgetsWidthToSubstract;

            return Column(
              children: [
                UNotificationCard(
                  username: widget.uNotification.username,
                  uMessage: UMessage(
                    message: ULibraryStrings.uNotification_sentYouALink,
                    arrivalMessageTime:
                        widget.uNotification.arrivalNotificationTime,
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
            );
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

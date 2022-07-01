part of '../u_notification.dart';

class _USentLinkNotification extends StatefulWidget {
  const _USentLinkNotification({
    Key? key,
    required this.uNotification,
    required this.linkUrl,
  }) : super(key: key);

  final UNotification uNotification;
  final String linkUrl;

  @override
  State<_USentLinkNotification> createState() => _USentLinkNotificationState();
}

class _USentLinkNotificationState extends State<_USentLinkNotification> {
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

    return FutureBuilder<Map<String, String>>(
        future: UFetchLinkData().fetch(widget.linkUrl),
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data != null) {
            final _linkData = snapshot.data!;
            final _widgetsWidthToSubstract =
                _correctWidthToSubstractToLinkDescription(
                    _linkData['type']!.contains('video'));
            final _widthLinkDescription =
                _screenSize.width - _widgetsWidthToSubstract;

            return Column(
              children: [
                UNotificationCard(
                  username: widget.uNotification.username,
                  uMessage: UMessage(
                    message: 'Sent you a link',
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
                            width:
                                _linkData['type']!.contains('video') ? 54 : 40,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: UImage(
                                imagePath: _linkData['image'],
                                imageSource: ImageSource.network,
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
                              UText(
                                _linkData['siteName']!,
                                textStyle: UTextStyle.H5_fifthHeader,
                              ),
                              const SizedBox.square(
                                dimension: 2,
                              ),
                              SizedBox(
                                width: _widthLinkDescription,
                                child: UText(
                                  _linkData['title']!,
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
                                  _linkData['description']!,
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
            return const Text('Loading');
          }
        });
  }
}

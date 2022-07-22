import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/username/username.dart';

class UNotificationCard extends StatelessWidget {
  /// Creates a card with notification with user image and username,
  /// and the type of notification
  ///
  /// It is not usually used alone,
  /// but rather as the return of [UNotification]
  const UNotificationCard({
    Key? key,
    required this.uNotification,
    this.messagePrefixIcon,
  }) : super(key: key);

  final UNotification uNotification;

  final UIconData? messagePrefixIcon;

  static const _firstSizedBoxSize = 12.0;
  static const _lastSizedBoxSize = 8.0;
  static const _userProfileSize = UUserProfileSize.normal;

  @override
  Widget build(BuildContext context) {
    final _lastMessageArrivalTime = DateFormatUtils.formatDateForMessageArrived(
      uNotification.arrivalNotificationTime,
    );

    final _pictureAndSizedBoxWidth = _userProfileSize.size + _firstSizedBoxSize;

    final _isFriendRequestAcceptedNotification =
        uNotification.notificationType == NotificationType.friendRequest &&
            (uNotification.message
                .contains(ULibraryStrings.uNotificationCard_youAreNowFriends));

    final _isFriendRequestDeclinedNotification =
        uNotification.notificationType == NotificationType.friendRequest &&
            uNotification.message.contains(
                ULibraryStrings.uNotificationCard_youDeclinedAFriendRequest);

    final _isFriendRequestReceivedNotification =
        uNotification.notificationType == NotificationType.friendRequest &&
            (uNotification.message.contains(
                ULibraryStrings.uNotificationCard_receivedAFriendRequest));

    double _returnNotificationHeight(NotificationType notificationType) {
      final _notificationTypeHeight = {
        NotificationType.serverMessage:
            USizes.uNotificationServerMessageHeightSize,
        NotificationType.message: USizes.uNotificationStandardHeightSize,
        NotificationType.friendRequest:
            USizes.uNotificationFriendRequestUpsideHeightSize,
        NotificationType.reactedComment: USizes.uNotificationStandardHeightSize,
        NotificationType.repliedComment: USizes.uNotificationStandardHeightSize,
        NotificationType.link: USizes.uNotificationLinkUpsideHeightSize,
      };
      return _notificationTypeHeight[notificationType] ?? 40.0;
    }

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWidth = constraints.maxWidth;

      return SizedBox(
        height: _returnNotificationHeight(uNotification.notificationType),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (uNotification.isUnread)
              UUserProfileNotification(
                uImage: uNotification.uImage,
                mainAxisAlignment: uNotification.notificationType ==
                        NotificationType.friendRequest
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
              )
            else
              UUserProfile(
                userProfileSize: _userProfileSize,
                uImage: uNotification.uImage,
                mainAxisAlignment: uNotification.notificationType ==
                        NotificationType.friendRequest
                    ? MainAxisAlignment.start
                    : MainAxisAlignment.center,
              ),
            const SizedBox.square(
              dimension: _firstSizedBoxSize,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: _widgetWidth - _pictureAndSizedBoxWidth,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Username(
                          username: uNotification.username,
                          textStyle: UTextStyle.H4_fourthHeader,
                        ),
                      ),
                      SizedBox(
                        width: 62,
                        child: UText(
                          _lastMessageArrivalTime,
                          textStyle: UTextStyle.M1_micro,
                          textColor: UColors.textDark,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox.square(
                  dimension: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (messagePrefixIcon != null) ...[
                      UIcon(messagePrefixIcon!),
                      const SizedBox.square(
                        dimension: _lastSizedBoxSize,
                      ),
                    ],
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: _isFriendRequestAcceptedNotification ||
                                  _isFriendRequestDeclinedNotification ||
                                  _isFriendRequestReceivedNotification
                              ? null
                              : _widgetWidth - _pictureAndSizedBoxWidth,
                          child: UText(
                            uNotification.message,
                            maxLines: 2,
                            textOverflow: TextOverflow.ellipsis,
                            textStyle: uNotification.notificationType ==
                                    NotificationType.serverMessage
                                ? UTextStyle.B2_medium
                                : UTextStyle.B1_body,
                            textColor: UColors.textMed,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        if (_isFriendRequestReceivedNotification ||
                            _isFriendRequestDeclinedNotification)
                          Padding(
                            padding: const EdgeInsets.only(left: 0.0),
                            child: UText(
                              ' ${uNotification.username} !',
                              maxLines: 1,
                              textFontWeight: FontWeight.bold,
                              textOverflow: TextOverflow.ellipsis,
                              textStyle: UTextStyle.B1_body,
                              textColor: UColors.white,
                              textAlign: TextAlign.left,
                            ),
                          )
                        else if (_isFriendRequestAcceptedNotification)
                          Row(
                            children: const [
                              UText(
                                ULibraryStrings.uNotificationCard_sayHi,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                textStyle: UTextStyle.B1_body,
                                textColor: UColors.textMed,
                                textAlign: TextAlign.left,
                              ),
                              UText(
                                ULibraryStrings.uNotificationCard_handWave,
                                maxLines: 1,
                                textOverflow: TextOverflow.ellipsis,
                                textStyle: UTextStyle.M1_micro,
                                textColor: UColors.textMed,
                                textAlign: TextAlign.left,
                              ),
                            ],
                          ),
                      ],
                    ),
                    if (_isFriendRequestAcceptedNotification)
                      UText(
                        ' ${uNotification.username} !',
                        maxLines: 1,
                        textFontWeight: FontWeight.bold,
                        textOverflow: TextOverflow.ellipsis,
                        textStyle: UTextStyle.B1_body,
                        textColor: UColors.white,
                        textAlign: TextAlign.left,
                      ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}

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

    final _isFriendRequestNotification = uNotification.notificationType ==
            NotificationType.friendRequest &&
        (uNotification.message
                .contains(ULibraryStrings.uNotificationCard_youAreNowFriends) ||
            uNotification.message.contains(
                ULibraryStrings.uNotificationCard_youDeclinedAFriendRequest));

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWidth = constraints.maxWidth;

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (uNotification.isUnread)
            UUserProfileNotification(
              uImage: uNotification.uImage,
            )
          else
            UUserProfile(
              userProfileSize: _userProfileSize,
              uImage: uNotification.uImage,
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
                    UText(
                      _lastMessageArrivalTime,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textDark,
                      textAlign: TextAlign.end,
                    ),
                  ],
                ),
              ),
              const SizedBox.square(
                dimension: 4,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  if (messagePrefixIcon != null) ...[
                    UIcon(messagePrefixIcon!),
                    const SizedBox.square(
                      dimension: _lastSizedBoxSize,
                    ),
                  ],
                  SizedBox(
                    width: _isFriendRequestNotification
                        ? null
                        : _widgetWidth - _pictureAndSizedBoxWidth,
                    child: UText(
                      uNotification.message,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (_isFriendRequestNotification)
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
              if (uNotification.message
                  .contains(ULibraryStrings.uNotificationCard_youAreNowFriends))
                Row(
                  children: const [
                    SizedBox(
                      width: _lastSizedBoxSize + 24,
                    ),
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
                      textStyle: UTextStyle.H1_primaryHeader,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
            ],
          ),
        ],
      );
    });
  }
}

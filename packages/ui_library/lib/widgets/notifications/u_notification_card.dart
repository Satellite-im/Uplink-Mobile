import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator.dart';
import 'package:ui_library/widgets/global/username/username.dart';

class UNotificationCard extends StatelessWidget {
  /// Creates a card with [UUserProfileWithStatus], username, message and [UnreadMessagesIndicator]
  const UNotificationCard({
    Key? key,
    required this.username,
    required UMessage uMessage,
    this.hasUnreadNotifications = true,
    UImage? uImage,
  })  : _uImage = uImage ?? const UImage(),
        _uMessage = uMessage,
        super(key: key);

  final String username;

  final UMessage _uMessage;

  final UImage? _uImage;

  final bool hasUnreadNotifications;

  String formatDateTime(DateTime arrivalMessageTime) {
    final _lastMessageArrivalTime =
        DateFormatUtils.formatDateTwelveHours(arrivalMessageTime);
    _lastMessageArrivalTime.toLowerCase();
    if (_lastMessageArrivalTime[0] == '0') {
      return _lastMessageArrivalTime.substring(1).toLowerCase();
    } else {
      return _lastMessageArrivalTime.toLowerCase();
    }
  }

  static const _firstSizedBoxSize = 12.0;
  static const _lastSizedBoxSize = 8.0;
  static const _userProfileSize = UUserProfileSize.normal;

  @override
  Widget build(BuildContext context) {
    final _lastMessageArrivalTime =
        formatDateTime(_uMessage.arrivalMessageTime);

    final _pictureAndSizedBoxWidth = _userProfileSize.size + _firstSizedBoxSize;

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWidth = constraints.maxWidth;

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasUnreadNotifications)
            UUserProfileNotification(
              uImage: _uImage,
            )
          else
            UUserProfile(
              userProfileSize: _userProfileSize,
              uImage: _uImage,
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
                        username: username,
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
                  if (_uMessage.prefixIcon != null) ...[
                    UIcon(_uMessage.prefixIcon!),
                    const SizedBox.square(
                      dimension: _lastSizedBoxSize,
                    ),
                  ],
                  SizedBox(
                    child: UText(
                      _uMessage.message,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (_uMessage.message.contains('You are now friends with') ||
                      _uMessage.message
                          .contains('You declined a friend request from'))
                    UText(
                      ' $username !',
                      maxLines: 1,
                      textFontWeight: FontWeight.bold,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.white,
                      textAlign: TextAlign.left,
                    ),
                ],
              ),
              if (_uMessage.message.contains('You are now friends with'))
                Row(
                  children: const [
                    SizedBox(
                      width: _lastSizedBoxSize + 24,
                    ),
                    UText(
                      'Say hi ',
                      maxLines: 1,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                    UText(
                      '👋',
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

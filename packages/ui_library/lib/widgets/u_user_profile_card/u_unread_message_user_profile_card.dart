import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator.dart';
import 'package:ui_library/widgets/global/username/username.dart';

class UnreadMessagesUserProfileCard extends StatelessWidget {
  /// Creates a card with [UUserProfileWithStatus], username, message and [UnreadMessagesIndicator]
  const UnreadMessagesUserProfileCard({
    Key? key,
    required Status status,
    required this.username,
    required UMessage uMessage,
    required this.unreadMessages,
    this.imagePath,
  })  : _status = status,
        _uMessage = uMessage,
        super(key: key);

  final Status _status;

  final String username;

  final UMessage _uMessage;

  final String? imagePath;

  final int unreadMessages;

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

  @override
  Widget build(BuildContext context) {
    final _unreadMessagesIndicator = UnreadMessagesIndicator(
      unreadMessages: unreadMessages,
      type: UnreadMessagesIndicatorType.card,
    );

    final _lastMessageArrivalTime =
        formatDateTime(_uMessage.arrivalMessageTime);

    const _userProfileSize = UUserProfileSize.normal;

    const _firstSizedBoxSize = 12.0;
    const _lastSizedBoxSize = 8.0;

    final _pictureAndSizedBoxWidth = _userProfileSize.size + _firstSizedBoxSize;

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWidth = constraints.maxWidth;

      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          UUserProfileWithStatus(
            status: _status,
            userProfileSize: _userProfileSize,
            imagePath: imagePath,
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
              const SizedBox.square(dimension: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: _widgetWidth -
                        _unreadMessagesIndicator
                            .getUnreadMessagesIndicatorWidth() -
                        _pictureAndSizedBoxWidth -
                        _lastSizedBoxSize,
                    child: UText(
                      _uMessage.message,
                      maxLines: 2,
                      textOverflow: TextOverflow.ellipsis,
                      textStyle: UTextStyle.B1_body,
                      textColor: UColors.textMed,
                      textAlign: TextAlign.left,
                    ),
                  ),
                  if (unreadMessages > 0) ...[
                    const SizedBox.square(
                      dimension: _lastSizedBoxSize,
                    ),
                    _unreadMessagesIndicator,
                  ],
                ],
              ),
            ],
          ),
        ],
      );
    });
  }
}

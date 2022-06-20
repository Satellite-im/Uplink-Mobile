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
    required String username,
    required UMessage uMessage,
    required int unreadMessages,
  })  : _status = status,
        _username = username,
        _uMessage = uMessage,
        _unreadMessages = unreadMessages,
        super(key: key);

  final Status _status;

  final String _username;

  final UMessage _uMessage;

  final int _unreadMessages;

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
      unreadMessages: _unreadMessages,
      type: UnreadMessagesIndicatorType.card,
    );
    const _finalWithSize = 28;

    const _firstUnreadMessagesIndicatorSize = 20;

    const _correctWidthForUsernameAndDateTimeRow =
        USizes.messageOnUnreadMessagesUserProfileCardWidthSize + _finalWithSize;

    final _correctWidthForMessage = _unreadMessages > 0
        ? USizes.messageOnUnreadMessagesUserProfileCardWidthSize -
            (_unreadMessagesIndicator.getUnreadMessagesIndicatorWidth() -
                _firstUnreadMessagesIndicatorSize)
        : USizes.messageOnUnreadMessagesUserProfileCardWidthSize +
            _finalWithSize;

    final _lastMessageArrivalTime =
        formatDateTime(_uMessage.arrivalMessageTime);

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        UUserProfileWithStatus(
          status: _status,
          userProfileSize: UUserProfileSize.normal,
        ),
        const SizedBox.square(
          dimension: 12,
        ),
        Column(
          children: [
            SizedBox(
              width: _correctWidthForUsernameAndDateTimeRow,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Username(
                      username: _username,
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
                  width: _correctWidthForMessage,
                  child: UText(
                    _uMessage.message,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: UTextStyle.H2_secondaryHeader,
                    textColor: UColors.textMed,
                  ),
                ),
                if (_unreadMessages > 0) ...[
                  const SizedBox.square(dimension: 8),
                  _unreadMessagesIndicator,
                ],
              ],
            ),
          ],
        ),
      ],
    );
  }
}

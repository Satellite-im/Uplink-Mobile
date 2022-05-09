import 'package:flutter/material.dart';
import 'package:ui_library/core/utils/date_format.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator/unread_messages_indicator.dart';
import 'package:ui_library/widgets/global/username/username.dart';

class UnreadMessagesUserProfileCard extends StatelessWidget {
  /// Creates a card with [UUserProfileWithStatus], username, message and [UnreadMessagesIndicatorForCards]
  const UnreadMessagesUserProfileCard({
    Key? key,
    required Status status,
    required String username,
    required String message,
    required int unreadMessages,
  })  : _status = status,
        _username = username,
        _message = message,
        _unreadMessages = unreadMessages,
        super(key: key);

  final Status _status;

  final String _username;

  final String _message;

  final int _unreadMessages;

  @override
  Widget build(BuildContext context) {
    final _unreadMessagesIndicator = UnreadMessagesIndicator(
      unreadMessages: _unreadMessages,
      type: UnreadMessagesIndicatorType.card,
    );
    final _correctWidthForUsernameAndDateTimeRow =
        USizes.messageOnUnreadMessagesUserProfileCardWidthSize +
            8 +
            _unreadMessagesIndicator.getUnreadMessagesIndicatorWidth();

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
                  Username(
                    username: _username,
                    textStyle: UTextStyle.H2_secondaryHeader,
                  ),
                  UText(
                    DateFormatUtils.formatDateTwelveHours(DateTime.now()),
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
                  width: USizes.messageOnUnreadMessagesUserProfileCardWidthSize,
                  child: UText(
                    _message,
                    maxLines: 2,
                    textOverflow: TextOverflow.ellipsis,
                    textStyle: UTextStyle.H2_secondaryHeader,
                    textColor: UColors.textMed,
                  ),
                ),
                const SizedBox.square(dimension: 8),
                _unreadMessagesIndicator,
              ],
            ),
          ],
        ),
      ],
    );
  }
}

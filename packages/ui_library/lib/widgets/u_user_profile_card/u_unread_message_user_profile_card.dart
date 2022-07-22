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
    UImage? uImage,
  })  : _status = status,
        _uImage = uImage ?? const UImage(),
        _uMessage = uMessage,
        super(key: key);

  final Status _status;

  final String username;

  final UMessage _uMessage;

  final UImage? _uImage;

  final int unreadMessages;

  @override
  Widget build(BuildContext context) {
    final _unreadMessagesIndicator = UnreadMessagesIndicator(
      unreadMessages: unreadMessages,
      type: UnreadMessagesIndicatorType.card,
    );

    final _lastMessageArrivalTime = DateFormatUtils.formatDateForMessageArrived(
        _uMessage.arrivalMessageTime);

    const _userProfileSize = UUserProfileSize.normal;

    const _firstSizedBoxSize = 12.0;
    const _lastSizedBoxSize = 8.0;

    final _pictureAndSizedBoxWidth = _userProfileSize.size + _firstSizedBoxSize;

    double _calculateLastMessageWidth(double _widgetWidth) {
      double _messageWidth = _widgetWidth -
          _unreadMessagesIndicator.getUnreadMessagesIndicatorWidth() -
          _pictureAndSizedBoxWidth;
      if (unreadMessages > 0) {
        _messageWidth -= _lastSizedBoxSize;
      }
      return _messageWidth;
    }

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWidth = constraints.maxWidth;

      return SizedBox(
        height: USizes.unreadMessagesUserProfileCardWidthSize,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            UUserProfileWithStatus(
              status: _status,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: SizedBox(
                          width: 62,
                          child: UText(
                            _lastMessageArrivalTime,
                            textStyle: UTextStyle.M1_micro,
                            textColor: UColors.textDark,
                            textAlign: TextAlign.end,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox.square(dimension: 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: _calculateLastMessageWidth(_widgetWidth),
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
                      Padding(
                        padding: const EdgeInsets.only(top: 6),
                        child: _unreadMessagesIndicator,
                      ),
                    ],
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

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator/unread_messafes_indicator_for_cards.dart';

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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UUserProfileWithStatus(
          status: _status,
          userProfileSize: UUserProfileSize.normal,
        ),
        const SizedBox.square(
          dimension: 12,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: USizes.userProfileNormalMaxUsernameTextSize,
              child: UText(
                _username,
                textOverflow: TextOverflow.ellipsis,
                maxLines: 1,
                textStyle: UTextStyle.H2_secondaryHeader,
                textColor: UColors.white,
              ),
            ),
            const SizedBox.square(
              dimension: 4,
            ),
            UText(
              _message,
              textStyle: UTextStyle.H2_secondaryHeader,
              textColor: UColors.textMed,
            ),
          ],
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        UnreadMessagesIndicatorForCards(
          unreadMessages: _unreadMessages,
        ),
      ],
    );
  }
}

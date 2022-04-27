import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/widgets/u_text/u_text.dart';

/// Creates an indicator of unread messages
class UnreadMessagesIndicator extends StatelessWidget {
  const UnreadMessagesIndicator({
    Key? key,
    required int unreadMessages,
  })  : _unreadMessages = unreadMessages,
        _size = USizes.unreadMessagesIndicatorSize,
        super(key: key);

  final double _size;

  final int _unreadMessages;

  double _getMessagesUnreadsIndicatorSize() {
    if (_unreadMessages < 10) {
      return 20;
    } else if (_unreadMessages < 100) {
      return 27;
    } else if (_unreadMessages < 1000) {
      return 35;
    } else if (_unreadMessages < 10000) {
      return 42;
    } else {
      return 42;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getMessagesUnreadsIndicatorSize(),
      height: _size,
      decoration: const BoxDecoration(
        color: UColors.ctaBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(
            100,
          ),
        ),
      ),
      child: Center(
        child: UText(
          _unreadMessages > 9999 ? '9999' : '$_unreadMessages',
          textStyle: UTextStyle.H2_secondaryHeader,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/widgets/u_text/u_text.dart';

class UnreadMessagesIndicator extends StatelessWidget {
  /// Creates unread messages indicator
  ///
  /// It changes the width size depending on the number of [_unreadMessages]
  ///
  /// Unread messages need to be greater than or equal to 0
  ///
  /// If the number of [_unreadMessages] is greater than 9999,
  /// in the widget will just show 9999
  const UnreadMessagesIndicator({
    Key? key,
    required int unreadMessages,
  })  : _unreadMessages = unreadMessages,
        _height = USizes.unreadMessagesIndicatorSize,
        assert(unreadMessages > -1),
        super(key: key);

  final double _height;

  final int _unreadMessages;

  double _getUnreadMessagesIndicatorWidth() {
    if (_unreadMessages < 10) {
      return USizes.unreadMessagesLessThanTenWidthSize;
    } else if (_unreadMessages < 100) {
      return USizes.unreadMessagesLessThanHundredWidthSize;
    } else if (_unreadMessages < 1000) {
      return USizes.unreadMessagesLessThanThousandWidthSize;
    } else if (_unreadMessages < 10000) {
      return USizes.unreadMessagesGreaterThanOrEqualToThousandWidthSize;
    } else {
      return USizes.unreadMessagesGreaterThanOrEqualToThousandWidthSize;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _getUnreadMessagesIndicatorWidth(),
      height: _height,
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

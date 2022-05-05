import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/widgets/u_text/u_text.dart';

class UnreadMessagesIndicatorForCards extends StatelessWidget {
  /// Creates unread messages indicator for cards
  ///
  /// It changes the width size depending on the number of [_unreadMessages]
  ///
  /// Unread messages need to be greater than or equal to 0
  ///
  /// If the number of [_unreadMessages] is greater than 9999,
  /// in the widget will just show 9999
  const UnreadMessagesIndicatorForCards({
    Key? key,
    required int unreadMessages,
  })  : _unreadMessages = unreadMessages,
        _height = USizes.unreadMessagesIndicatorSize,
        assert(unreadMessages > -1),
        super(key: key);

  final double _height;

  final int _unreadMessages;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      decoration: const BoxDecoration(
        color: UColors.ctaBlue,
        borderRadius: BorderRadius.all(
          Radius.circular(
            4,
          ),
        ),
      ),
      child: Center(
        child: UText(
          _unreadMessages > 9999 ? '9999' : '$_unreadMessages',
          textStyle: UTextStyle.H3_tertiaryHeader,
        ),
      ),
    );
  }
}

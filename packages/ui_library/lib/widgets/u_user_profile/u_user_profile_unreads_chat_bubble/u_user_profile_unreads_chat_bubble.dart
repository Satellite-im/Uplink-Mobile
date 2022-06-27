import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/clipper/u_clipper.dart';
import 'package:ui_library/widgets/global/global_export.dart';
import 'package:ui_library/widgets/global/unread_messages_indicator.dart';

import '../../../core/core_export.dart';
import '../models/models_export.dart';

/// Creates an User Profile Unread Messages Chat Bubble Widget
class UUserProfileUnreadsChatBubble extends StatelessWidget {
  /// Creates User Profile Unread Messages Chat Bubble Widget
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfileUnreadsChatBubble({
    Key? key,
    UImage? uImage,
    required int unreadMessages,
  })  : _uImage = uImage ?? const UImage(),
        _uUserProfileSize = UUserProfileSize.large,
        _unreadMessages = unreadMessages,
        super(key: key);

  final UUserProfileSize _uUserProfileSize;

  final int _unreadMessages;

  final UImage? _uImage;

  @override
  Widget build(BuildContext context) {
    final _uClipper = UClipper();
    final _unreadMessagesIndicator = UnreadMessagesIndicator(
      unreadMessages: _unreadMessages,
      type: UnreadMessagesIndicatorType.profile,
    );
    final _correctPositionNotification =
        _uUserProfileSize.size - (USizes.unreadMessagesIndicatorSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: ClipPath(
                clipper:
                    _uClipper.clipForUnreadMessagesChatBubble(_unreadMessages),
                child: SizedBox(
                  height: _uUserProfileSize.size,
                  width: _uUserProfileSize.size,
                  child: _uImage,
                ),
              ),
            ),
            Positioned(
              top: _correctPositionNotification,
              right: _unreadMessages >= 1000 ? 0.6 : 0,
              child: _unreadMessagesIndicator,
            ),
          ],
        ),
      ],
    );
  }
}

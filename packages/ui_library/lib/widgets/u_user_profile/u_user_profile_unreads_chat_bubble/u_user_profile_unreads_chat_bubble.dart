import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/messages_unreads_indicator.dart';

import '../../../core/core_export.dart';
import '../models/models_export.dart';

part 'models/clipper.dart';

/// Creates an User Profile Unread Messages Chat Bubble Widget
class UUserProfileUnreadsChatBubble extends StatelessWidget {
  /// Creates User Profile Unread Messages Chat Bubble Widget
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfileUnreadsChatBubble({
    Key? key,
    String? imagePath,
    required int unreadMessages,
  })  : _imagePath = imagePath,
        _uUserProfileSize = UUserProfileSize.large,
        _unreadMessages = unreadMessages,
        super(key: key);

  final UUserProfileSize _uUserProfileSize;

  final int _unreadMessages;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    final _unreadMessagesIndicator = UnreadMessagesIndicator(
      unreadMessages: _unreadMessages,
    );
    final _correctPositionNotification =
        _uUserProfileSize.size - (USizes.unreadMessagesIndicatorSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ClipPath(
                  clipper: UserProfileUnreadsChatBubbleClipper(_unreadMessages),
                  child: SizedBox(
                    height: _uUserProfileSize.size,
                    width: _uUserProfileSize.size,
                    child: _imagePath != null
                        ? Image.network(_imagePath!)
                        : Image.asset(
                            'packages/ui_library/images/placeholders/user_avatar_2.png',
                          ),
                  ),
                ),
              ),
              Positioned(
                top: _correctPositionNotification,
                right: 0,
                child: _unreadMessagesIndicator,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

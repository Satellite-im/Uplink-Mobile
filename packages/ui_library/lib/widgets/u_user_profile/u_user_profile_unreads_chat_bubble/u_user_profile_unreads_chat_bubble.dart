import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../u_text/u_text_export.dart';
import '../models/models_export.dart';

part 'models/clipper.dart';
part 'models/messages_unreads.dart';

/// Creates an User Profile Unreads Widget
class UUserProfileUnreadsChatBubble extends StatelessWidget {
  /// Creates User Profile Unreads Widget without name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfileUnreadsChatBubble({
    Key? key,
    String? imagePath,
    required int messagesUnreads,
  })  : _imagePath = imagePath,
        _uUserProfileSize = UUserProfileSize.large,
        _messagesUnreads = messagesUnreads,
        super(key: key);

  final UUserProfileSize _uUserProfileSize;

  final int _messagesUnreads;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    final _messagesUnreadsIndicator = MessagesUnreadsIndicator(
      messagesUnreads: _messagesUnreads,
    );
    final _correctPositionNotification = _uUserProfileSize.size -
        (USizes.userProfileMessagesUnreadsIndicatorSize);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          // width: _messagesUnreads > 9999
          //     ? USizes.userProfileMessagesUnreadsMaxMessagesSize
          //     : null,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: ClipPath(
                  clipper:
                      UserProfileUnreadsChatBubbleClipper(_messagesUnreads),
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
                child: _messagesUnreadsIndicator,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

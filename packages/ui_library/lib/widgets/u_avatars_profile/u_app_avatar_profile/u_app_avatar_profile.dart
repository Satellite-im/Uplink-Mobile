import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_sizes.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/widgets/global/messages_unreads_indicator.dart';

import '../models/models_export.dart';

part 'models/clipper.dart';

enum _AppAvatarType { normal, chatBubble }

/// Creates an App Avatar Profile Widget with picture
/// and no status
class UAppAvatarProfile extends StatelessWidget {
  /// Creates App Avatar Profile Widget
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UAppAvatarProfile({
    Key? key,
    String? imagePath,
  })  : _imagePath = imagePath,
        _type = _AppAvatarType.normal,
        _size = UAvatarProfileSize.normal,
        _unreadMessages = 0,
        super(key: key);

  const UAppAvatarProfile.chatBubble({
    Key? key,
    String? imagePath,
    required int unreadMessages,
  })  : _imagePath = imagePath,
        _type = _AppAvatarType.chatBubble,
        _size = UAvatarProfileSize.large,
        _unreadMessages = unreadMessages,
        super(key: key);

  final UAvatarProfileSize _size;

  final _AppAvatarType _type;

  final int _unreadMessages;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return _type == _AppAvatarType.normal
        ? _AppAvatarNormal(size: _size, imagePath: _imagePath)
        : _AppAvatarChatBubble(
            imagePath: _imagePath,
            unreadMessages: _unreadMessages,
            size: _size,
          );
  }
}

class _AppAvatarChatBubble extends StatelessWidget {
  const _AppAvatarChatBubble({
    Key? key,
    required String? imagePath,
    required int unreadMessages,
    required UAvatarProfileSize size,
  })  : _imagePath = imagePath,
        _unreadMessages = unreadMessages,
        _appAvatarSize = size,
        super(key: key);

  final String? _imagePath;

  final int _unreadMessages;

  final UAvatarProfileSize _appAvatarSize;

  @override
  Widget build(BuildContext context) {
    final _messagesUnreadsIndicator = UnreadMessagesIndicator(
      unreadMessages: _unreadMessages,
    );
    final _correctPositionNotification =
        _appAvatarSize.size - (USizes.unreadMessagesIndicatorSize);
    return Stack(
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: ClipPath(
            clipper: _unreadMessages != 0
                ? AppAvatarProfileChatBubbleClipper(_unreadMessages)
                : null,
            child: SizedBox(
              height: _appAvatarSize.size,
              width: _appAvatarSize.size,
              child: _imagePath != null
                  ? Image.network(_imagePath!)
                  : Image.asset(
                      'packages/ui_library/images/placeholders/app_avatar.png',
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
    );
  }
}

class _AppAvatarNormal extends StatelessWidget {
  const _AppAvatarNormal({
    Key? key,
    required UAvatarProfileSize size,
    required String? imagePath,
  })  : _appAvatarSize = size,
        _imagePath = imagePath,
        super(key: key);

  final UAvatarProfileSize _appAvatarSize;
  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        height: _appAvatarSize.size,
        width: _appAvatarSize.size,
        child: _imagePath != null
            ? Image.network(_imagePath!)
            : Image.asset(
                'packages/ui_library/images/placeholders/app_avatar.png',
              ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/clipper/u_clipper.dart';
import 'package:ui_library/widgets/global/messages_unreads_indicator.dart';

import '../models/models_export.dart';

part 'models/app_avatar_chat_bubble.dart';
part 'models/app_avatar_normal.dart';

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
  })  : _type = _AppAvatarType.normal,
        _size = UAvatarProfileSize.normal,
        _unreadMessages = 0,
        super(key: key);

  const UAppAvatarProfile.chatBubble({
    Key? key,
    String? imagePath,
    required int unreadMessages,
  })  : _type = _AppAvatarType.chatBubble,
        _size = UAvatarProfileSize.large,
        _unreadMessages = unreadMessages,
        super(key: key);

  final UAvatarProfileSize _size;

  final _AppAvatarType _type;

  final int _unreadMessages;

  @override
  Widget build(BuildContext context) {
    return _type == _AppAvatarType.normal
        ? _AppAvatarNormal(
            size: _size,
          )
        : _AppAvatarChatBubble(
            unreadMessages: _unreadMessages,
            size: _size,
          );
  }
}

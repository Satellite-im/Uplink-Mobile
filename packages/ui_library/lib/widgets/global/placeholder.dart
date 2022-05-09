import 'package:flutter/material.dart';
import 'package:ui_library/core/const/u_colors.dart';

enum _PlaceholderType { user, avatar, group, server }

extension _PlaceholderImagePath on _PlaceholderType {
  String get _path {
    switch (this) {
      case _PlaceholderType.user:
        return 'packages/ui_library/images/placeholders/user_avatar_2.png';
      case _PlaceholderType.avatar:
        return 'packages/ui_library/images/placeholders/uplink_logo.png';
      case _PlaceholderType.group:
        return 'packages/ui_library/images/placeholders/server_avatar_1.png';
      case _PlaceholderType.server:
        return 'packages/ui_library/images/placeholders/server_avatar_2.png';
    }
  }
}

/// Class to access image assets and return the placeholder
///
/// If the image fails to load, It will be replaced with a container
/// with backgroundColor depending on [_placeholderType]
class UPlaceholder extends StatelessWidget {
  const UPlaceholder.userProfile({Key? key})
      : _placeholderType = _PlaceholderType.user,
        super(key: key);

  const UPlaceholder.avatarProfile({Key? key})
      : _placeholderType = _PlaceholderType.avatar,
        super(key: key);

  const UPlaceholder.groupProfile({Key? key})
      : _placeholderType = _PlaceholderType.group,
        super(key: key);

  const UPlaceholder.serverProfile({Key? key})
      : _placeholderType = _PlaceholderType.server,
        super(key: key);

  final _PlaceholderType _placeholderType;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _placeholderType._path,
      errorBuilder: (context, error, stackTrace) => _Container(
        placeholderType: _placeholderType,
      ),
      frameBuilder: (context, child, inter, wasSynchronouslyLoaded) =>
          _Container(
        child: child,
        placeholderType: _placeholderType,
      ),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container({Key? key, this.child, required this.placeholderType})
      : super(key: key);

  final Widget? child;

  final _PlaceholderType placeholderType;

  @override
  Widget build(BuildContext context) {
    final _backgroundColor = placeholderType == _PlaceholderType.avatar
        ? UColors.foregroundDark
        : UColors.defGrey;
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: _backgroundColor,
          width: 0.05,
        ),
        color: _backgroundColor,
      ),
      child: child,
    );
  }
}

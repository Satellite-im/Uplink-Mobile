import 'package:flutter/material.dart';

import '../../core/core_export.dart';

part 'models/u_status_indicator.dart';
part 'models/u_user_profile_status_clipper.dart';

class UserProfileStatus extends StatelessWidget {
  UserProfileStatus.topMenuBar({
    Key? key,
    String? imagePath,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator = StatusIndicator.small(status),
        _size = USizes.userProfileTopMenuBarSize,
        super(key: key);

  UserProfileStatus.normal({
    Key? key,
    String? imagePath,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator = StatusIndicator.normal(status),
        _size = USizes.userProfileNormalSize,
        super(key: key);

  UserProfileStatus.large({
    Key? key,
    String? imagePath,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator = StatusIndicator.normal(status),
        _size = USizes.userProfileLargeSize,
        super(key: key);

  final double _size;

  final String? _imagePath;

  final StatusIndicator _statusIndicator;

  @override
  Widget build(BuildContext context) {
    final _correctPositionForEachAvatar = _size - (_statusIndicator._size);

    return Stack(
      children: [
        SizedBox(
          child: ClipPath(
            clipper: UClipperUserProfileStatus(),
            child: SizedBox(
              height: _size,
              width: _size,
              child: _imagePath != null
                  ? Image.network(_imagePath!)
                  : Image.asset(
                      'packages/ui_library/images/placeholders/user_avatar_2.png',
                    ),
            ),
          ),
        ),
        Positioned(
          top: _correctPositionForEachAvatar,
          left: _correctPositionForEachAvatar,
          child: _statusIndicator,
        ),
      ],
    );
  }
}

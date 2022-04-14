import 'package:flutter/material.dart';
import 'package:ui_library/widgets/u_user_profile/models/u_user_profile_sizes.dart';

import '../../core/core_export.dart';

part 'models/u_status_indicator.dart';
part 'models/u_user_profile_status_clipper.dart';

class UserProfileWithStatus extends StatelessWidget {
  UserProfileWithStatus({
    Key? key,
    String? imagePath,
    required UUserProfileSize userProfileSize,
    required Status status,
  })  : _imagePath = imagePath,
        _statusIndicator =
            StatusIndicator(status, userProfileSize: userProfileSize),
        _size = userProfileSize.size,
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

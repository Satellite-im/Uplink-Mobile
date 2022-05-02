import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/clipper/u_clipper.dart';
import 'package:ui_library/widgets/global/placeholders/user_profile_placeholder.dart';
import 'package:ui_library/widgets/u_user_profile/models/u_user_profile_sizes.dart';

import '../../../core/core_export.dart';

part 'models/status_indicator.dart';

class UUserProfileWithStatus extends StatelessWidget {
  /// Creates an User Profile Widget with picture
  /// and [Status]
  ///
  /// [imagePath] if null, it will assume a default placeholder
  ///
  /// [userProfileSize] defines the size of the widget
  const UUserProfileWithStatus({
    Key? key,
    String? imagePath,
    required UUserProfileSize userProfileSize,
    required Status status,
  })  : _imagePath = imagePath,
        _status = status,
        _uUserProfileSize = userProfileSize,
        super(key: key);

  final UUserProfileSize _uUserProfileSize;

  final String? _imagePath;

  final Status _status;

  @override
  Widget build(BuildContext context) {
    final _uClipper = UClipper();
    final _statusIndicator =
        StatusIndicator(_status, userProfileSize: _uUserProfileSize);
    final _correctPositionForEachAvatar =
        _uUserProfileSize.size - (_statusIndicator._size);

    return Stack(
      children: [
        ClipPath(
          clipper: _uClipper.clipForUserProfileWithStatus(),
          child: SizedBox(
            height: _uUserProfileSize.size,
            width: _uUserProfileSize.size,
            child: _imagePath != null
                ? Image.network(_imagePath!)
                : const UserProfilePlaceHolder(),
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

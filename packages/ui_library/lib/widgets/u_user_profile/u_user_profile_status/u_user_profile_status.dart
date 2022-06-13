import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/clipper/u_clipper.dart';
import 'package:ui_library/widgets/global/placeholder.dart';
import 'package:ui_library/widgets/u_status/u_status_indicator.dart';
import 'package:ui_library/widgets/u_user_profile/models/u_user_profile_sizes.dart';

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
        UStatusIndicator(_status, userProfileSize: _uUserProfileSize);
    final _correctPositionForEachAvatar =
        _uUserProfileSize.size - (_statusIndicator.size);

    return Stack(
      children: [
        ClipPath(
          clipper: _uClipper.clipForUserProfileWithStatus(),
          child: SizedBox(
            height: _uUserProfileSize.size,
            width: _uUserProfileSize.size,
            child: _imagePath != null
                ? Image.network(_imagePath!)
                : const UPlaceholder.userProfile(),
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

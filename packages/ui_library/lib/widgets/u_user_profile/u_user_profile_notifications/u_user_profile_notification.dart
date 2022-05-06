import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/clipper/u_clipper.dart';
import 'package:ui_library/widgets/global/placeholder.dart';
import 'package:ui_library/widgets/global/username/username.dart';

import '../../../core/core_export.dart';
import '../models/models_export.dart';

part 'models/notification.dart';

/// Creates an User Profile Notification Widget
class UUserProfileNotification extends StatelessWidget {
  /// Creates User Profile Notification Widget without name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfileNotification({
    Key? key,
    String? imagePath,
  })  : _imagePath = imagePath,
        _userProfileType = UUserProfileType.noUsername,
        _userProfileUsername = null,
        _uUserProfileSize = UUserProfileSize.normal,
        super(key: key);

  /// Creates User Profile Notification Widget with name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfileNotification.withUsername({
    Key? key,
    String? imagePath,
    required String username,
  })  : _imagePath = imagePath,
        _userProfileUsername = username,
        _userProfileType = UUserProfileType.withUsername,
        _uUserProfileSize = UUserProfileSize.normal,
        super(key: key);

  final UUserProfileSize _uUserProfileSize;

  final UUserProfileType _userProfileType;

  final String? _userProfileUsername;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    final _uClipper = UClipper();
    const _notificationsIndicator = NotificationIndicator();
    final _correctPositionNotification =
        _uUserProfileSize.size - (_notificationsIndicator._size);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Stack(
          children: [
            ClipPath(
              clipper: _uClipper.clipForUserProfileWithNotification(),
              child: SizedBox(
                height: _uUserProfileSize.size,
                width: _uUserProfileSize.size,
                child: _imagePath != null
                    ? Image.network(_imagePath!)
                    : const UPlaceholder.userProfile(),
              ),
            ),
            Positioned(
              top: _correctPositionNotification,
              left: _correctPositionNotification,
              child: _notificationsIndicator,
            ),
          ],
        ),
        if (_userProfileType == UUserProfileType.withUsername) ...[
          const SizedBox.square(dimension: 8),
          Username(
            username: _userProfileUsername!,
          ),
        ]
      ],
    );
  }
}

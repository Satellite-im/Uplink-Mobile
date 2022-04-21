import 'package:flutter/material.dart';

import '../../../core/core_export.dart';
import '../../u_text/u_text_export.dart';
import '../models/u_user_profile_sizes.dart';

enum _UserProfileType { withUsername, noUsername }

/// Creates an User Profile Widget with picture
/// and no status
class UserProfile extends StatelessWidget {
  /// Creates User Profile widget without name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UserProfile({
    Key? key,
    String? imagePath,
  })  : _imagePath = imagePath,
        _userProfileType = _UserProfileType.noUsername,
        _userProfileUsername = null,
        _size = UUserProfileSize.normal,
        super(key: key);

  /// Creates User Profile widget with name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UserProfile.withUsername({
    Key? key,
    String? imagePath,
    required String username,
  })  : _imagePath = imagePath,
        _userProfileUsername = username,
        _userProfileType = _UserProfileType.withUsername,
        _size = UUserProfileSize.normal,
        super(key: key);

  final UUserProfileSize _size;

  final _UserProfileType _userProfileType;

  final String? _userProfileUsername;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipOval(
          child: SizedBox(
            height: _size.size,
            width: _size.size,
            child: _imagePath != null
                ? Image.network(_imagePath!)
                : Image.asset(
                    'packages/ui_library/images/placeholders/user_avatar_2.png',
                  ),
          ),
        ),
        if (_userProfileType == _UserProfileType.withUsername) ...[
          const SizedBox.square(dimension: 8),
          SizedBox(
            width: USizes.userProfileNormalMaxUsernameTextSize,
            child: UText(
              _userProfileUsername!,
              textOverflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              maxLines: 1,
              textStyle: UTextStyle.M1_micro,
            ),
          ),
        ]
      ],
    );
  }
}

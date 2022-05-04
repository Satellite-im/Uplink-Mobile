import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/placeholder.dart';

import '../../../core/core_export.dart';
import '../../u_text/u_text_export.dart';
import '../models/models_export.dart';

/// Creates an User Profile Widget with picture
/// and no status
class UUserProfile extends StatelessWidget {
  /// Creates User Profile Widget without name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfile({
    Key? key,
    String? imagePath,
  })  : _imagePath = imagePath,
        _userProfileType = UUserProfileType.noUsername,
        _userProfileUsername = null,
        _size = UUserProfileSize.normal,
        super(key: key);

  /// Creates User Profile Widget with name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfile.withUsername({
    Key? key,
    String? imagePath,
    required String username,
  })  : _imagePath = imagePath,
        _userProfileUsername = username,
        _userProfileType = UUserProfileType.withUsername,
        _size = UUserProfileSize.normal,
        super(key: key);

  final UUserProfileSize _size;

  final UUserProfileType _userProfileType;

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
                : const UPlaceholder.userProfile(),
          ),
        ),
        if (_userProfileType == UUserProfileType.withUsername) ...[
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

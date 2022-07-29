import 'package:flutter/material.dart';
import 'package:ui_library/widgets/global/global_export.dart';

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
    UUserProfileSize? userProfileSize,
    UImage? uImage,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : _uImage = uImage ?? const UImage(),
        _userProfileType = UUserProfileType.noUsername,
        _userProfileUsername = null,
        _size = userProfileSize ?? UUserProfileSize.normal,
        super(key: key);

  /// Creates User Profile Widget with name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfile.withUsername({
    Key? key,
    required String username,
    UUserProfileSize? userProfileSize,
    UImage? uImage,
    this.mainAxisAlignment = MainAxisAlignment.center,
  })  : _uImage = uImage ?? const UImage(),
        _userProfileUsername = username,
        _userProfileType = UUserProfileType.withUsername,
        _size = userProfileSize ?? UUserProfileSize.normal,
        super(key: key);

  final UUserProfileSize _size;

  final UUserProfileType _userProfileType;

  final String? _userProfileUsername;

  final MainAxisAlignment mainAxisAlignment;

  final UImage? _uImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ClipOval(
          child: SizedBox(
            height: _size.size,
            width: _size.size,
            child: _uImage,
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
              textColor: UColors.white,
            ),
          ),
        ]
      ],
    );
  }
}

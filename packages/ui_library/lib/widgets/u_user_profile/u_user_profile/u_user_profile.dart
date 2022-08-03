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
    UUserProfileSize? secondUserProfileSize,
    UImage? uImage,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.isFirstSize,
    this.sizeAnimationDuration = Duration.zero,
  })  : _uImage = uImage ?? const UImage(),
        _userProfileType = UUserProfileType.noUsername,
        _userProfileUsername = null,
        _size = userProfileSize ?? UUserProfileSize.normal,
        _secondSize = secondUserProfileSize ?? UUserProfileSize.normal,
        super(key: key);

  /// Creates User Profile Widget with name
  ///
  /// [imagePath] if null, it will assume a default placeholder
  const UUserProfile.withUsername({
    Key? key,
    required String username,
    UUserProfileSize? userProfileSize,
    UUserProfileSize? secondUserProfileSize,
    UImage? uImage,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.sizeAnimationDuration = Duration.zero,
    this.isFirstSize,
  })  : _uImage = uImage ?? const UImage(),
        _userProfileUsername = username,
        _userProfileType = UUserProfileType.withUsername,
        _size = userProfileSize ?? UUserProfileSize.normal,
        _secondSize = secondUserProfileSize ?? UUserProfileSize.normal,
        super(key: key);

  final UUserProfileSize _size;

  /// Value used only for size change with animation
  final UUserProfileSize _secondSize;

  final UUserProfileType _userProfileType;

  final String? _userProfileUsername;

  final MainAxisAlignment mainAxisAlignment;

  final UImage? _uImage;

  /// Value used only for size change with animation
  final Duration sizeAnimationDuration;

  /// Value used only for size change with animation
  final bool? isFirstSize;

  double _changeSize() {
    if (isFirstSize != null && _secondSize != _size) {
      return isFirstSize! ? _size.size : _secondSize.size;
    }
    return _size.size;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        ClipOval(
          child: AnimatedContainer(
            duration: sizeAnimationDuration,
            height: _changeSize(),
            width: _changeSize(),
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

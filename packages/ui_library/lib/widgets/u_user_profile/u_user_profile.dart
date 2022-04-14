import 'package:flutter/material.dart';

import '../../core/core_export.dart';
import '../u_text/u_text_export.dart';

enum _UserProfileType { withName, noName }

class UserProfile extends StatelessWidget {
  const UserProfile({
    Key? key,
    String? imagePath,
  })  : _imagePath = imagePath,
        _userProfileType = _UserProfileType.noName,
        _userProfileName = null,
        _size = USizes.userProfileNormalSize,
        super(key: key);

  const UserProfile.withName({
    Key? key,
    String? imagePath,
    required String name,
  })  : _imagePath = imagePath,
        _userProfileName = name,
        _userProfileType = _UserProfileType.withName,
        _size = USizes.userProfileNormalSize,
        super(key: key);

  final double _size;

  final _UserProfileType _userProfileType;

  final String? _userProfileName;

  final String? _imagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          child: ClipOval(
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
        if (_userProfileType == _UserProfileType.withName) ...[
          const SizedBox.square(dimension: 8),
          UText(
            _userProfileName!,
            textStyle: UTextStyle.M1_micro,
          ),
        ]
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UNavDrawerUserProfileCard extends StatelessWidget {
  /// Creates a card with [UUserProfileWithStatus], username and a message
  const UNavDrawerUserProfileCard({
    Key? key,
    required Status status,
    required String username,
    required String message,
  })  : _status = status,
        _username = username,
        _message = message,
        super(key: key);

  final Status _status;

  final String _username;

  final String _message;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        UUserProfileWithStatus(
          status: _status,
          userProfileSize: UUserProfileSize.normal,
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        SizedBox(
          width: USizes.userProfileNormalMaxUsernameTextSize,
          child: UText(
            _username,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
            textStyle: UTextStyle.H2_secondaryHeader,
            textColor: UColors.white,
          ),
        ),
        const SizedBox.square(
          dimension: 2,
        ),
        UText(
          _message,
          textStyle: UTextStyle.H2_secondaryHeader,
          textColor: UColors.textMed,
        ),
      ],
    );
  }
}

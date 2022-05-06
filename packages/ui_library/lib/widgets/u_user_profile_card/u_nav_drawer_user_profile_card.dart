import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/username/username.dart';

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
        Username(
          username: _username,
          textStyle: UTextStyle.H3_tertiaryHeader,
        ),
        const SizedBox.square(
          dimension: 2,
        ),
        SizedBox(
          width: USizes.messageOnUserProfileCardWidthSize,
          child: UText(
            _message,
            textStyle: UTextStyle.H2_secondaryHeader,
            textColor: UColors.textMed,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
    );
  }
}

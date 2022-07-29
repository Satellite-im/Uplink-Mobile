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
    UImage? uImage,
  })  : _status = status,
        _uImage = uImage ?? const UImage(),
        _username = username,
        _message = message,
        super(key: key);

  final Status _status;

  final String _username;

  final String _message;

  final UImage? _uImage;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: USizes.uNavDrawerUserProfileCardHeightSize,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          UUserProfileWithStatus(
            status: _status,
            userProfileSize: UUserProfileSize.normal,
            uImage: _uImage,
          ),
          const SizedBox.square(
            dimension: 8,
          ),
          SizedBox(
            width: double.infinity,
            child: Username(
              username: _username,
              textStyle: UTextStyle.H4_fourthHeader,
            ),
          ),
          const SizedBox.square(
            dimension: 3,
          ),
          UText(
            _message,
            textStyle: UTextStyle.B1_body,
            textColor: UColors.textMed,
            textOverflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }
}

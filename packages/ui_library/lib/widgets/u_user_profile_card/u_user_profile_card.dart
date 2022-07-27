import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/global/username/username.dart';

class UUserProfileCard extends StatelessWidget {
  /// Creates a card with [UUserProfileWithStatus], username and a message
  const UUserProfileCard({
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
    const _userProfileSize = UUserProfileSize.normal;
    const _firstSizedBoxSize = 12.0;
    final _pictureAndSizedBoxWidth = _userProfileSize.size + _firstSizedBoxSize;

    return LayoutBuilder(builder: (context, constraints) {
      final _widgetWith = constraints.maxWidth;
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UUserProfileWithStatus(
            status: _status,
            userProfileSize: _userProfileSize,
            uImage: _uImage,
          ),
          const SizedBox.square(
            dimension: _firstSizedBoxSize,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: _widgetWith - _pictureAndSizedBoxWidth,
                child: Username(
                  username: _username,
                  textStyle: UTextStyle.H4_fourthHeader,
                ),
              ),
              const SizedBox.square(
                dimension: 3,
              ),
              SizedBox(
                width: _widgetWith - _pictureAndSizedBoxWidth,
                child: UText(
                  _message,
                  textStyle: UTextStyle.B1_body,
                  textColor: UColors.textMed,
                  textOverflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}

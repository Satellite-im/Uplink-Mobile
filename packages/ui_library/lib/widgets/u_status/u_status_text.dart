import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UStatusText extends StatelessWidget {
  const UStatusText({
    Key? key,
    required this.status,
  }) : super(key: key);

  final Status status;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        UStatusIndicator(
          status,
          userProfileSize: UUserProfileSize.normal,
        ),
        const SizedBox.square(
          dimension: 6,
        ),
        UText(
          "${status.name[0].toUpperCase()}${status.name.substring(1).toLowerCase()}",
          textStyle: UTextStyle.B2_medium,
          textColor: UColors.white,
        )
      ],
    );
  }
}

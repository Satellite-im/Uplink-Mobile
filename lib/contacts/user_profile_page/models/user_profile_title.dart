import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UserProfileTitle extends StatelessWidget {
  const UserProfileTitle({
    Key? key,
    required this.title,
    required this.iconData,
  }) : super(key: key);

  final String title;
  final UIconData iconData;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UIcon(
          iconData,
          color: UColors.textMed,
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        UText(
          title,
          textStyle: UTextStyle.H3_tertiaryHeader,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ULogoutButton extends StatelessWidget {
  ///[TextButton] with a logout icon:
  ///```dart
  ///ULogoutButton(onPressed: () {}),
  ///```
  const ULogoutButton({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: onPressed,
        icon: const UIcon(
          UIcons.settings_logout,
          color: UColors.textMed,
          size: UIconSize.small,
        ),
        label: const UText(
          'Logout',
          textStyle: UTextStyle.B2_medium,
          textColor: UColors.textMed,
        ));
  }
}

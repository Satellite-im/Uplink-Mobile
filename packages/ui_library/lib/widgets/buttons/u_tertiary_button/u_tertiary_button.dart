import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UTertiaryButton extends StatelessWidget {
  const UTertiaryButton(
      {Key? key, required this.onPressed, required this.label, this.color})
      : super(key: key);
  final VoidCallback onPressed;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: UText(label,
          textStyle: UTextStyle.BUT2_secondaryButton,
          textColor: color ?? UColors.textDark),
    );
  }
}

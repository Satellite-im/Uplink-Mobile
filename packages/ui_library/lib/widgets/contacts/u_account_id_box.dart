import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UAccountIDBox extends StatelessWidget {
  const UAccountIDBox({Key? key, required this.id, required this.onTap})
      : super(key: key);
  final String id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: UColors.foregroundDark,
        ),
        padding: const EdgeInsets.all(16),
        child: InkWell(
            child: UText(
              id,
              textStyle: UTextStyle.M1_micro,
              textColor: UColors.white,
            ),
            onTap: onTap));
  }
}

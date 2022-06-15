import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UIconText extends StatelessWidget {
  /// Creates a row with [UIcon] and [UText]
  const UIconText({
    Key? key,
    required String text,
    required UIconData icon,
  })  : _text = text,
        _icon = icon,
        super(key: key);

  final String _text;
  final UIconData _icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UIcon(
          _icon,
        ),
        const SizedBox.square(
          dimension: 8,
        ),
        UText(
          _text,
          textStyle: UTextStyle.B1_body,
          textColor: UColors.white,
        )
      ],
    );
  }
}

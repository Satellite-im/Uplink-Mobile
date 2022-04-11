import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

part 'models/u_text_style.dart';

class UText extends StatelessWidget {
  const UText(
    this.text, {
    Key? key,
    required this.textStyle,
    this.maxLines,
    this.textColor,
  }) : super(key: key);

  final String text;

  /// The style to use for this text.
  final UTextStyle textStyle;

  final Color? textColor;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      style: TextStyle(
        fontFamily: textStyle.style.fontFamily,
        fontSize: textStyle.style.fontSize,
        fontStyle: textStyle.style.fontStyle,
        fontWeight: textStyle.style.fontWeight,
        color: textColor ?? textStyle.style.color,
        backgroundColor: textStyle.style.backgroundColor,
      ),
      maxLines: maxLines,
    );
  }
}

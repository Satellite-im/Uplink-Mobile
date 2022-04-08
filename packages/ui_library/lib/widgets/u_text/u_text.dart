import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

part 'models/u_text_style.dart';

class UText extends StatelessWidget {
  const UText(
    this.text, {
    Key? key,
    required this.textStyle,
    this.maxLines,
  }) : super(key: key);

  final String text;

  /// The style to use for this text.
  final UTextStyle textStyle;

  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      style: textStyle._style,
      maxLines: maxLines,
    );
  }
}

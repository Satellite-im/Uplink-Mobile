import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

part 'models/u_text_style.dart';

class UText extends StatelessWidget {
  /// Creates an [UText].
  ///
  /// If [textColor] is null, the text color will be black.
  ///
  /// Example:
  /// ```dart
  ///  @override
  ///  Widget build(BuildContext context) {
  ///  return Padding(
  ///    padding: const EdgeInsets.all(8.0),
  ///    child: UText(
  ///     iconName,
  ///     textStyle: UTextStyle.H4_fourthHeader,
  ///    ),
  ///  );
  /// }
  /// ```
  const UText(
    this.text, {
    Key? key,
    required this.textStyle,
    this.maxLines,
    this.textColor,
    this.textOverflow,
    this.textAlign,
  }) : super(key: key);

  final String text;

  /// The style to use for this text.
  final UTextStyle textStyle;

  final Color? textColor;

  final int? maxLines;

  final TextOverflow? textOverflow;

  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      key: key,
      overflow: textOverflow,
      textAlign: textAlign,
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

import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';
import 'package:ui_library/widgets/widgets_export.dart';

class UDialogDoubleButtons extends StatelessWidget {
  const UDialogDoubleButtons(
      {Key? key,
      required this.title,
      required this.bodyText,
      required this.buttonText,
      required this.popUpButtonText,
      required this.onTap})
      : super(key: key);

  final String title;
  final String bodyText;
  final String buttonText;
  final String popUpButtonText;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return UDialogStyle(
      title: UText(
        title,
        textStyle: UTextStyle.H2_secondaryHeader,
        textColor: UColors.textMed,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          UText(
            bodyText,
            textStyle: UTextStyle.B1_body,
            textColor: UColors.white,
          ),
          const SizedBox(height: 16),
          UButton.filled1(
            label: buttonText,
            onPressed: onTap,
          ),
          UButton.filled2(
            label: popUpButtonText,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

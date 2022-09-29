import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDialogSingleButton extends StatelessWidget {
  const UDialogSingleButton({
    Key? key,
    required this.title,
    required this.bodyText,
    required this.buttonText,
    this.onPop,
  }) : super(key: key);
  final String title;
  final String bodyText;
  final String buttonText;
  final VoidCallback? onPop;

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
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          UButton.filled1(
            label: buttonText,
            onPressed: () {
              onPop?.call();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}

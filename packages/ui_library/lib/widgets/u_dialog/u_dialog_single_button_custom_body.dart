import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDialogSingleButtonCustomBody extends StatelessWidget {
  const UDialogSingleButtonCustomBody(
      {Key? key,
      required this.title,
      required this.body,
      required this.buttonText})
      : super(key: key);
  final String title;
  final Widget body;
  final String buttonText;

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
          body,
          const SizedBox.square(
            dimension: 16,
          ),
          UButton.filled1(
            label: buttonText,
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class UBottomSheetTwoButtons {
  final BuildContext context;

  final String header;

  final String firstButtonText;
  final VoidCallback firstButtonOnPressed;
  final UIconData? firstButtonIcon;

  final String secondButtonText;
  final VoidCallback secondButtonOnPressed;
  final UIconData? secondButtonIcon;

  UBottomSheetTwoButtons(
    this.context, {
    required this.firstButtonOnPressed,
    required this.secondButtonOnPressed,
    required this.header,
    required this.firstButtonText,
    this.firstButtonIcon,
    required this.secondButtonText,
    this.secondButtonIcon,
  });

  Future show() {
    return UBottomSheet(
      context,
      child: _UBottomSheetTwoButtonsBody(
        header: header,
        firstButtonOnPressed: firstButtonOnPressed,
        firstButtonText: firstButtonText,
        firstButtonIcon: firstButtonIcon,
        secondButtonOnPressed: secondButtonOnPressed,
        secondButtonText: secondButtonText,
        secondButtonIcon: secondButtonIcon,
      ),
    ).show();
  }
}

class _UBottomSheetTwoButtonsBody extends StatelessWidget {
  const _UBottomSheetTwoButtonsBody(
      {Key? key,
      required this.header,
      required this.firstButtonText,
      this.firstButtonIcon,
      required this.secondButtonText,
      this.secondButtonIcon,
      required this.firstButtonOnPressed,
      required this.secondButtonOnPressed})
      : super(key: key);

  final String header;

  final String firstButtonText;
  final VoidCallback firstButtonOnPressed;
  final UIconData? firstButtonIcon;

  final String secondButtonText;
  final VoidCallback secondButtonOnPressed;
  final UIconData? secondButtonIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 30, 16, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UText(
            header,
            textStyle: UTextStyle.H5_fifthHeader,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          Row(
            children: [
              if (firstButtonIcon == null) ...[
                Expanded(
                  child: UButton.filled2(
                    label: firstButtonText,
                    onPressed: firstButtonOnPressed,
                  ),
                )
              ] else ...[
                Expanded(
                  child: UButton.secondary(
                      label: firstButtonText,
                      uIconData: firstButtonIcon!,
                      onPressed: firstButtonOnPressed),
                ),
              ],
              const SizedBox.square(
                dimension: 8,
              ),
              if (secondButtonIcon == null) ...[
                Expanded(
                  child: UButton.filled1(
                    label: secondButtonText,
                    onPressed: secondButtonOnPressed,
                  ),
                )
              ] else ...[
                Expanded(
                  child: UButton.primary(
                      label: secondButtonText,
                      uIconData: secondButtonIcon!,
                      onPressed: secondButtonOnPressed),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

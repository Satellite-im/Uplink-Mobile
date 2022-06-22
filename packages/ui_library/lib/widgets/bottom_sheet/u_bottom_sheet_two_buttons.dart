import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class UBottomSheetTwoButtons {
  /// Creates a bottom sheet to use with two button options
  ///
  /// It is possible to use buttons with or without icons
  ///
  /// To use, is necessary to call the class and the method [show]
  ///
  /// You need to call an action to show the [UBottomSheetTwoButtons],
  /// example:
  /// ```dart
  /// UButton.filled1(
  ///   label: 'Click here to see the bottom sheet',
  ///    onPressed: () {
  ///      UBottomSheetTwoButtons(context,
  ///         firstButtonIcon: UIcons.add_button,
  ///         secondButtonIcon: UIcons.add_contact_member,
  ///         firstButtonOnPressed: () {},
  ///         secondButtonOnPressed: () {},
  ///         header: 'Bottom Sheet with two UButtons with icons',
  ///         firstButtonText: 'First Button',
  ///         secondButtonText: 'Second Button')
  ///            .show();
  ///   }),
  /// ```
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

  final BuildContext context;

  /// The text on the top of the bottom sheet
  final String header;

  final String firstButtonText;
  final VoidCallback firstButtonOnPressed;

  /// If is null, the button will not have an icon
  final UIconData? firstButtonIcon;

  final String secondButtonText;
  final VoidCallback secondButtonOnPressed;

  /// If is null, the button will not have an icon
  final UIconData? secondButtonIcon;

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

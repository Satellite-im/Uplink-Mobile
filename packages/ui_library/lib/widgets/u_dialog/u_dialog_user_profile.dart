import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';
import 'package:ui_library/widgets/widgets_export.dart';

class UDialogUserProfile extends StatelessWidget {
  const UDialogUserProfile(
      {Key? key,
      required this.bodyText,
      required this.buttonText,
      required this.popButtonText,
      this.popButtonOnTap,
      required this.onTap,
      UImage? uImage,
      this.buttonColor,
      required this.username,
      this.statusMessage})
      : _uImage = uImage ?? const UImage(),
        super(key: key);
  final String bodyText;
  final String buttonText;
  final Color? buttonColor;
  final String popButtonText;
  final VoidCallback? popButtonOnTap;
  final VoidCallback onTap;
  final UImage? _uImage;
  final String username;
  final String? statusMessage;

  @override
  Widget build(BuildContext context) {
    return UDialogStyle(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 8),
          UUserProfile(
            userProfileSize: UUserProfileSize.large,
            uImage: _uImage,
          ),
          const SizedBox(height: 16),
          UText(
            username,
            textStyle: UTextStyle.H2_secondaryHeader,
            textColor: UColors.white,
          ),
          UText(
            statusMessage ?? '',
            textStyle: UTextStyle.B1_body,
            textColor: UColors.textMed,
          ),
          const SizedBox(height: 16),
          UText(
            bodyText,
            textStyle: UTextStyle.B1_body,
            textColor: UColors.white,
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              UButton.filled1(
                label: buttonText,
                onPressed: onTap,
                color: buttonColor,
              ),
              UButton.filled2(
                label: popButtonText,
                onPressed: () {
                  popButtonOnTap?.call();
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

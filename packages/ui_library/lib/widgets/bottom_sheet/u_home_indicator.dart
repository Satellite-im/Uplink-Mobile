import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';

class UHomeIndicator extends StatelessWidget {
  const UHomeIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        decoration: const BoxDecoration(
          color: UColors.textDark,
          borderRadius: BorderRadius.all(
            Radius.circular(USizes.barAboveBottomSheetBorderRadius),
          ),
        ),
        height: USizes.barAboveBottomSheetHeightSize,
        width: USizes.barAboveBottomSheetWidthSize,
      ),
    );
  }
}

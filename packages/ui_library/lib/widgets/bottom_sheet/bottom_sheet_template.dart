import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

class UBottomSheet {
  final BuildContext context;

  final Widget child;

  UBottomSheet(
    this.context, {
    required this.child,
  });
  Future show() {
    return showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        isDismissible: true,
        useRootNavigator: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(USizes.barAboveBottomSheetBorderRadius),
            topRight: Radius.circular(USizes.barAboveBottomSheetBorderRadius),
          ),
        ),
        builder: (context) {
          return Wrap(
            children: [
              Center(
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
              ),
              Container(
                decoration: const BoxDecoration(
                  color: UColors.modalDark,
                  borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular(USizes.bottomSheetTemplateBorderRadius),
                    topRight:
                        Radius.circular(USizes.bottomSheetTemplateBorderRadius),
                  ),
                ),
                child: child,
              ),
            ],
          );
        });
  }
}

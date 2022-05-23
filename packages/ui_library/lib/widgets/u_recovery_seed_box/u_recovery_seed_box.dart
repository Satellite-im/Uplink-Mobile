import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class URecoverySeedBox extends StatelessWidget {
  const URecoverySeedBox({
    Key? key,
    required this.word,
    required this.wordNumber,
  }) : super(key: key);

  final String word;

  final int wordNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: USizes.recoverySeedBoxWidthSize,
      height: USizes.recoverySeedBoxHeightSize,
      decoration: const BoxDecoration(
        color: UColors.foregroundDark,
        borderRadius: BorderRadius.all(
          Radius.circular(4),
        ),
      ),
      child: Stack(
        children: [
          Center(
            child: UText(
              word,
              textStyle: UTextStyle.H5_fifthHeader,
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: USizes.recoverySeedBoxNumberBoxWidthSize,
              height: USizes.recoverySeedBoxNumberBoxHeightSize,
              decoration: const BoxDecoration(
                color: UColors.ctaBlue,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Center(
                child: UText(
                  wordNumber.toString(),
                  textStyle: UTextStyle.M1_micro,
                  textColor: UColors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

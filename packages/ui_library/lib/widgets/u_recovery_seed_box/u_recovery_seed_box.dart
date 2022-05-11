import 'package:flutter/material.dart';
import 'package:ui_library/core/const/const_export.dart';

class URecoverySeedBox extends StatelessWidget {
  const URecoverySeedBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: 160,
        height: 40,
        decoration: const BoxDecoration(
          color: UColors.foregroundDark,
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
      ),
      Positioned(
        top: 0,
        left: 0,
        child: Container(
          width: 14,
          height: 15,
          decoration: const BoxDecoration(
              color: UColors.ctaBlue,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4))),
        ),
      ),
    ]);
  }
}

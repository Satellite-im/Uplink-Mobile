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
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        builder: (context) {
          return Wrap(
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(bottom: 9),
                  decoration: const BoxDecoration(
                    color: UColors.textDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  height: 2,
                  width: 72,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: UColors.modalDark,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: child,
              ),
            ],
          );
        });
  }
}

class _BottomSheetBackground extends StatelessWidget {
  const _BottomSheetBackground({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 9),
            decoration: const BoxDecoration(
              color: UColors.textDark,
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            height: 2,
            width: 72,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: UColors.modalDark,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
            ),
          ),
          // Expanded(
          //   child: Container(
          //     decoration: const BoxDecoration(
          //       color: MoonContantsColors.secondaryDarker,
          //     ),
          //   ),
          // ),
        ],
      );
}

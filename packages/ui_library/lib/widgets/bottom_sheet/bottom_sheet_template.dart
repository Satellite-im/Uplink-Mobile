import 'package:flutter/material.dart';
import 'package:ui_library/core/core_export.dart';

class UBottomSheet {
  final BuildContext context;

  final Widget child;

  UBottomSheet(
    this.context,
    this.child,
  );
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
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.width > 500
              ? MediaQuery.of(context).size.width
              : 500,
        ),
        builder: (context) {
          return Stack(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 4),
                decoration: const BoxDecoration(
                  color: UColors.textDark,
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                height: 2,
                width: 72,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 20),
                child: child,
              ),
            ],
          );
        });
  }
}

// class _BottomSheetBackground extends StatelessWidget {
//   const _BottomSheetBackground({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) => Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         mainAxisSize: MainAxisSize.max,
//         children: [
//           Container(
//             margin: EdgeInsets.only(bottom: MoonSpacerSize.xxxs.kSize),
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.all(
//                 Radius.circular(5),
//               ),
//             ),
//             height: 4,
//             width: 64,
//           ),
//           Expanded(
//             child: Container(
//               decoration: BoxDecoration(
//                 color: MoonContantsColors.secondaryDark,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(MoonSpacerSize.xxs.kSize),
//                   topRight: Radius.circular(MoonSpacerSize.xxs.kSize),
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               decoration: const BoxDecoration(
//                 color: MoonContantsColors.secondaryDarker,
//               ),
//             ),
//           ),
//         ],
//       );
// }}
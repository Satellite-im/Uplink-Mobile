// // import 'dart:math' as math;

// // import 'package:flutter/material.dart';
// // import 'package:ui_library/ui_library_export.dart';
// // import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';
// // import 'package:uplink/l10n/main_app_strings.dart';
// // import 'package:uplink/utils/ui_utils/qr_code/qr_code_page.dart';

// // UBottomSheet qrCodeBottomSheet(
// //   BuildContext context,
// //   String? userImagePath,
// // ) {
// //   return UBottomSheet(
// //     context,
// //     child: GestureDetector(
// //       behavior: HitTestBehavior.translucent,
// //       onVerticalDragUpdate: (details) {
// //         // TODO(Lucas): Improve the way to transition
// //         if (details.delta.dy < 0) {
// //           Navigator.of(context, rootNavigator: true).push(
// //             MaterialPageRoute<Widget>(
// //               fullscreenDialog: true,
// //               builder: (context) => QRCodePage(
// //                 userImagePath: userImagePath,
// //               ),
// //             ),
// //           );
// //         } else if (details.localPosition.dy > 0) {
// //           Navigator.of(context, rootNavigator: true).pop();
// //         }
// //       },
// //       onDoubleTap: () async {
// //         await Navigator.of(context, rootNavigator: true).push(
// //           MaterialPageRoute<Widget>(
// //             fullscreenDialog: true,
// //             builder: (context) => QRCodePage(
// //               userImagePath: userImagePath,
// //             ),
// //           ),
// //         );
// //       },
// //       child: Padding(
// //         padding: const EdgeInsets.fromLTRB(70, 30, 70, 37),
// //         child: Column(
// //           children: [
// //             Center(
// //               child: UUserProfile(
// //                 uImage: UImage(imagePath: userImagePath),
// //               ),
// //             ),
// //             const SizedBox.square(
// //               dimension: 12,
// //             ),
// //             const UText(
// //               UAppStrings.profileIndexPage_username,
// //               textStyle: UTextStyle.H2_secondaryHeader,
// //             ),
// //             const SizedBox.square(
// //               dimension: 2,
// //             ),
// //             const UText(
// //               UAppStrings.profileIndexPage_statusMessage,
// //               textStyle: UTextStyle.B1_body,
// //             ),
// //             const SizedBox.square(
// //               dimension: 24,
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 const UIcon(
// //                   UIcons.qr_code_scanner_border,
// //                   color: UColors.textMed,
// //                 ),
// //                 Transform(
// //                   alignment: Alignment.center,
// //                   transform: Matrix4.rotationY(math.pi),
// //                   child: const UIcon(
// //                     UIcons.qr_code_scanner_border,
// //                     color: UColors.textMed,
// //                   ),
// //                 )
// //               ],
// //             ),
// //             const SizedBox.square(
// //               dimension: 172,
// //               child: UQRCode(
// //                 qrCodeData: UAppStrings.profileIndexPage_qrCodeData,
// //               ),
// //             ),
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Transform(
// //                   alignment: Alignment.center,
// //                   transform: Matrix4.rotationX(math.pi),
// //                   child: const UIcon(
// //                     UIcons.qr_code_scanner_border,
// //                     color: UColors.textMed,
// //                   ),
// //                 ),
// //                 Transform(
// //                   alignment: Alignment.center,
// //                   transform: Matrix4.rotationZ(math.pi),
// //                   child: const UIcon(
// //                     UIcons.qr_code_scanner_border,
// //                     color: UColors.textMed,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     ),
// //   );
// // }

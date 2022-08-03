import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_current_user.dart';

part 'qr_code_bottom_sheet_body.dart';
part 'qr_code_page.dart';

GlobalKey<QRCodePageState> qrCodePageKey = GlobalKey();

class QRCodeBottomSheet extends StatefulWidget {
  const QRCodeBottomSheet({
    Key? key,
    required this.currentUser,
  }) : super(key: key);

  final MockCurrentUser currentUser;

  @override
  State<QRCodeBottomSheet> createState() => _QRCodeBottomSheetState();
}

class _QRCodeBottomSheetState extends State<QRCodeBottomSheet> {
  bool _readyToClose = true;

  @override
  Widget build(BuildContext context) {
    return NotificationListener<DraggableScrollableNotification>(
      onNotification: (notification) {
        if (notification.extent <= 0.3 && _readyToClose) {
          _readyToClose = false;
          Navigator.of(context).pop();
        }
        if (notification.extent < 0.98) {
          qrCodePageKey.currentState?.showAppBar = false;
        }
        if (notification.extent == 1) {
          qrCodePageKey.currentState?.controller = null;
          qrCodePageKey.currentState?.showHomeIndicator = false;
        }
        if (notification.extent > 0.98) {
          qrCodePageKey.currentState?.showAppBar = true;
        }
        if (notification.extent > 0.8) {
          qrCodePageKey.currentState?.isPage = true;
        }
        if (notification.extent < 0.8) {
          qrCodePageKey.currentState?.isPage = false;
        }
        return true;
      },
      child: DraggableScrollableSheet(
        snapSizes: const [0.65, 1],
        minChildSize: 0,
        initialChildSize: 0.65,
        snap: true,
        builder: (context, scrollController) => QRCodePage(
          key: qrCodePageKey,
          currentUser: widget.currentUser,
          controller: scrollController,
          isFromBottomSheet: true,
          showHomeIndicator: true,
        ),
      ),
    );
  }
}

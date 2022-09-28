import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:ui_library/ui_library_export.dart';

class UQRCodeScanner extends StatefulWidget {
  const UQRCodeScanner({Key? key, required this.onFindQrCode})
      : super(key: key);

  final Function(String) onFindQrCode;

  @override
  State<UQRCodeScanner> createState() => _UQRCodeScannerState();
}

class _UQRCodeScannerState extends State<UQRCodeScanner>
    with TickerProviderStateMixin {
  MobileScannerController cameraController = MobileScannerController();
  final layerLink = LayerLink();
  late AnimationController? _animationController;
  late Animation<double> _animation;
  Timer _timerForOverlay = Timer(Duration.zero, () {});

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController!);
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _timerForOverlay.cancel();
    super.dispose();
  }

  void _showOverlay(
    BuildContext context, {
    required String text,
    required bool foundUserDID,
  }) {
    final overlay = Overlay.of(context);
    final leftOffset = MediaQuery.of(context).size.width / 2 - 50;
    final _positionY = MediaQuery.of(context).size.height - 200;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 200,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          //overlay won't show on the screen when move to other pages
          offset: Offset(leftOffset, _positionY),
          child: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: _animation.value,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: !foundUserDID ? 48 : 56),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 9, 16, 8),
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                      color: !foundUserDID ? UColors.termRed : UColors.ctaBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: UText(
                      text,
                      textStyle: UTextStyle.B2_medium,
                      textColor: UColors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    _animationController?.addListener(() {
      overlay!.setState(() {});
    });
    overlay!.insert(overlayEntry);
    _animationController?.forward();
    _timerForOverlay = Timer(
      Duration(milliseconds: !foundUserDID ? 1000 : 5000),
      () => _animationController?.reverse().whenComplete(
            overlayEntry.remove,
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: UAppBar.actions(
          title: 'User QR Code Scanner',
          actionList: [
            IconButton(
              color: UColors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.torchState,
                builder: (context, state, child) {
                  switch (state) {
                    case TorchState.off:
                      return const Icon(Icons.flash_off,
                          color: UColors.defGrey);
                    case TorchState.on:
                      return const Icon(Icons.flash_on,
                          color: UColors.idleYellow);
                  }
                },
              ),
              iconSize: UIconSize.normal.toDouble(),
              onPressed: () => cameraController.toggleTorch(),
            ),
            IconButton(
              color: UColors.white,
              icon: ValueListenableBuilder(
                valueListenable: cameraController.cameraFacingState,
                builder: (context, state, child) {
                  switch (state) {
                    case CameraFacing.front:
                      return const Icon(Icons.camera_front);
                    case CameraFacing.back:
                      return const Icon(Icons.camera_rear);
                  }
                },
              ),
              iconSize: UIconSize.normal.toDouble(),
              onPressed: () => cameraController.switchCamera(),
            ),
          ],
        ),
        body: CompositedTransformTarget(
          link: layerLink,
          child: MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: (qrCode, args) async {
                if (qrCode.rawValue == null) {
                  debugPrint('Failed to scan Barcode');
                  _showOverlay(context,
                      text: 'Failed to scan QR Code', foundUserDID: false);
                } else {
                  final String code = qrCode.rawValue!;
                  if (code.contains('did:key:')) {
                    widget.onFindQrCode(code.replaceAll('did:key:', ''));
                  } else {
                    _showOverlay(context,
                        text: 'Not a valid user ID', foundUserDID: false);
                  }
                  debugPrint('Barcode found! $code');
                }
              }),
        ));
  }
}

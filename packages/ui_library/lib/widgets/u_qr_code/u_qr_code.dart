import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UQRCode extends StatelessWidget {
  const UQRCode({
    Key? key,
    required this.qrCodeData,
  }) : super(key: key);

  final String qrCodeData;

  @override
  Widget build(BuildContext context) {
    return QrImage(
      data: qrCodeData,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.white,
      version: QrVersions.auto,
      gapless: false,
    );
  }
}

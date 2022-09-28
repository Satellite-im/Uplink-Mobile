import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class UQRCode extends StatelessWidget {
  /// Generate a QR code
  const UQRCode({
    Key? key,
    required this.userDID,
  }) : super(key: key);

  final String userDID;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(2),
      child: QrImage(
        data: 'did:key:$userDID',
        padding: const EdgeInsets.all(8),
        backgroundColor: Colors.white,
        version: QrVersions.auto,
        gapless: false,
      ),
    );
  }
}

import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'package:uplink/l10n/main_app_strings.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({Key? key, required this.userImagePath}) : super(key: key);

  final String? userImagePath;

  @override
  State<QRCodePage> createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(
        title: UAppStrings.qrCodePage_appBarTitle,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox.square(dimension: 16),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: UText(
                  UAppStrings.qrCodePage_pageDescription,
                  textStyle: UTextStyle.B1_body,
                ),
              ),
              const SizedBox.square(dimension: 32),
              Center(
                child: UUserProfile(
                  uImage: UImage(
                    imagePath: widget.userImagePath,
                    imageSource: ImageSource.file,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox.square(
                dimension: 16,
              ),
              const Center(
                child: UText(
                  UAppStrings.profileIndexPage_username,
                  textStyle: UTextStyle.H2_secondaryHeader,
                ),
              ),
              const SizedBox.square(
                dimension: 2,
              ),
              const Center(
                child: UText(
                  UAppStrings.profileIndexPage_statusMessage,
                  textStyle: UTextStyle.B1_body,
                ),
              ),
              const SizedBox.square(
                dimension: 32,
              ),
              const _QRCode(),
              const SizedBox.square(
                dimension: 56,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: double.infinity,
                  child: UButton.primary(
                    label: UAppStrings.qrCodePage_buttonText,
                    uIconData: UIcons.camera,
                    onPressed: () {},
                  ),
                ),
              ),
              const SizedBox.square(
                dimension: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _QRCode extends StatelessWidget {
  const _QRCode({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 36),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const UIcon(
                UIcons.qr_code_scanner_border,
                color: UColors.textMed,
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationY(math.pi),
                child: const UIcon(
                  UIcons.qr_code_scanner_border,
                  color: UColors.textMed,
                ),
              )
            ],
          ),
          const Center(
            child: SizedBox.square(
              dimension: 240,
              child: UQRCode(
                qrCodeData: UAppStrings.profileIndexPage_qrCodeData,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationX(math.pi),
                child: const UIcon(
                  UIcons.qr_code_scanner_border,
                  color: UColors.textMed,
                ),
              ),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(math.pi),
                child: const UIcon(
                  UIcons.qr_code_scanner_border,
                  color: UColors.textMed,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

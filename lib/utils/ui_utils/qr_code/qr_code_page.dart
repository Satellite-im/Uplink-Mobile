import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_current_user.dart';

part 'qr_code_full_page.dart';
part 'qr_code_bottom_sheet_body.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({
    Key? key,
    required this.currentUser,
    this.controller,
    this.reducedTopHeight,
    this.backButtonOpacity,
    this.isFromBottomSheet,
    this.showHomeIndicator,
    this.showAppBar,
    this.isPage,
  }) : super(key: key);

  final MockCurrentUser currentUser;
  final ScrollController? controller;
  final double? reducedTopHeight;
  final double? backButtonOpacity;
  final bool? isFromBottomSheet;
  final bool? showHomeIndicator;
  final bool? showAppBar;
  final bool? isPage;

  @override
  State<QRCodePage> createState() => QRCodePageState();
}

class QRCodePageState extends State<QRCodePage>
    with SingleTickerProviderStateMixin {
  late MockCurrentUser currentUser;
  double backButtonOpacity = 1;
  // used to connect draggableScrollableSheet
  ScrollController? controller;
  // used to reduce the top height when it is bottom sheet
  double reducedTopHeight = 0;
  // for back navigation in vertical direction of bottomsheet
  late AnimationController _animationController;
  bool showHomeIndicator = false;
  bool showAppBar = false;
  bool isPage = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    currentUser = widget.currentUser;
    controller = widget.controller;

    if (widget.isPage != null) {
      isPage = widget.isPage!;
    }

    if (widget.reducedTopHeight != null) {
      reducedTopHeight = widget.reducedTopHeight!;
    }

    if (widget.backButtonOpacity != null) {
      backButtonOpacity = widget.backButtonOpacity!;
    }
    if (widget.showHomeIndicator != null) {
      showHomeIndicator = widget.showHomeIndicator!;
    }
    if (widget.showAppBar != null) {
      showAppBar = widget.showAppBar!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
          .animate(_animationController),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: CustomScrollView(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            slivers: [
              if (showHomeIndicator == true)
                const SliverToBoxAdapter(
                  child: UHomeIndicator(),
                ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UColors.backgroundDark,
                  ),
                  child: isPage == true
                      ? _QRCodeFullPage(
                          showAppBar: showAppBar,
                          currentUser: currentUser,
                        )
                      : _QRCodeBottomSheet(
                          currentUser: currentUser,
                        ),
                ),
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

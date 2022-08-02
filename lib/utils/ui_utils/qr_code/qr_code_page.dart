import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_current_user.dart';

part 'qr_code_bottom_sheet_body.dart';

class QRCodePage extends StatefulWidget {
  const QRCodePage({
    Key? key,
    required this.currentUser,
    required this.controller,
    this.isFromBottomSheet,
    this.showHomeIndicator,
    this.showAppBar,
    this.isPage,
  }) : super(key: key);

  final MockCurrentUser currentUser;
  final ScrollController controller;
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
  ScrollController? controller;
  late AnimationController _animationController;
  bool showHomeIndicator = false;
  bool showAppBar = false;
  bool isPage = false;
  ScrollPhysics scrollPhysics = const ClampingScrollPhysics();

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    currentUser = widget.currentUser;
    controller = widget.controller;

    if (widget.isPage != null) {
      isPage = widget.isPage!;
    }
    if (widget.showHomeIndicator != null) {
      showHomeIndicator = widget.showHomeIndicator!;
    }
    if (widget.showAppBar != null) {
      showAppBar = widget.showAppBar!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: Tween<Offset>(begin: Offset.zero, end: const Offset(1, 0))
          .animate(_animationController),
      child: Container(
        color: showAppBar ? UColors.backgroundDark : Colors.transparent,
        padding: EdgeInsets.only(
          top: MediaQueryData.fromWindow(
            WidgetsBinding.instance!.window,
          ).padding.top,
        ),
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            controller: controller,
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: AnimatedCrossFade(
                  duration: const Duration(milliseconds: 250),
                  crossFadeState: showAppBar
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  firstChild: const UHomeIndicator(),
                  secondChild: const SizedBox.shrink(),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: UColors.backgroundDark,
                  ),
                  child: _QRCodeBottomSheet(
                    currentUser: currentUser,
                    isPage: isPage,
                    showAppBar: showAppBar,
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

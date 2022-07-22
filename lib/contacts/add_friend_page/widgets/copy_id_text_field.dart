import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/models/models_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class CopyIDTextField extends StatefulWidget {
  const CopyIDTextField({
    Key? key,
  }) : super(key: key);

  @override
  State<CopyIDTextField> createState() => _CopyIDTextFieldState();
}

class _CopyIDTextFieldState extends State<CopyIDTextField>
    with TickerProviderStateMixin {
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

  @override
  Widget build(BuildContext context) {
    // TODO(yijing): update account id
    const userId = 'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: const [
            UIcon(
              UIcons.account_id,
              color: UColors.textMed,
            ),
            SizedBox(width: 9),
            UText(
              UAppStrings.addFriendPage_yourAccount,
              textStyle: UTextStyle.H3_tertiaryHeader,
            )
          ],
        ),
        const SizedBox(height: 16),
        const UText(
          UAppStrings.addFriendPage_copyAccountID,
          textStyle: UTextStyle.B1_body,
          textColor: UColors.white,
        ),
        const SizedBox(height: 24),
        CompositedTransformTarget(
          link: layerLink,
          child: UAccountIDBox(
            id: userId,
            onTap: () {
              Clipboard.setData(const ClipboardData(text: userId)).whenComplete(
                () => _showOverlay(
                  context,
                  text: UAppStrings.addFriendPage_copied,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }

  Future<void> _showOverlay(
    BuildContext context, {
    required String text,
  }) async {
    final overlay = Overlay.of(context);
    final leftOffset = MediaQuery.of(context).size.width / 2 - 50;

    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 80,
        child: CompositedTransformFollower(
          link: layerLink,
          showWhenUnlinked: false,
          //overlay won't show on the screen when move to other pages
          offset: Offset(leftOffset, 64),
          child: Material(
            color: Colors.transparent,
            child: Opacity(
              opacity: _animation.value,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomPaint(painter: FatTriangle()),
                      const SizedBox(width: 16),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 9, 16, 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: UColors.ctaBlue,
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
    await _animationController?.forward();
    _timerForOverlay = Timer(
      const Duration(milliseconds: 1250),
      () => _animationController?.reverse().whenComplete(
            overlayEntry.remove,
          ),
    );
  }
}

//Copied animated label

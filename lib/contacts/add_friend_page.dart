// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/models/fat_triangle.dart';
import 'package:uplink/utils/ui_utils/qr_code_bottom_sheet.dart';

class AddFriendPage extends StatefulWidget {
  const AddFriendPage({Key? key}) : super(key: key);

  @override
  State<AddFriendPage> createState() => _AddFriendPageState();
}

class _AddFriendPageState extends State<AddFriendPage>
    with TickerProviderStateMixin {
  OverlayEntry? overlayEntry;
  final layerLink = LayerLink();
  late AnimationController _animationController;
  late Animation<double> _animation;
  late GlobalKey<FormFieldState<String>> _formfieldKey;
  bool _disableButton = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);
    _formfieldKey = GlobalKey<FormFieldState<String>>();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const userId = 'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94';
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'Add Friend',
        actionList: [
          IconButton(
            icon: const UIcon(
              UIcons.qr_code,
              color: UColors.textMed,
            ),
            onPressed: () {
              qrCodeBottomSheet(
                context,
                null,
              ).show();
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: const [
                UIcon(UIcons.account_id),
                SizedBox(width: 9),
                UText(
                  'Your Account ID',
                  textStyle: UTextStyle.H3_tertiaryHeader,
                )
              ],
            ),
            const SizedBox(height: 16),
            const UText(
              'Make new friends by tapping your account ID to copy and share.',
              textStyle: UTextStyle.B1_body,
              textColor: UColors.white,
            ),
            const SizedBox(height: 24),
            CompositedTransformTarget(
              link: layerLink,
              child: Container(
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: UColors.foregroundDark,
                ),
                padding: const EdgeInsets.all(16),
                // TODO(yijing): update to account ID
                child: InkWell(
                  child: const UText(
                    userId,
                    textStyle: UTextStyle.H5_fifthHeader,
                    textColor: UColors.white,
                  ),
                  onTap: () {
                    Clipboard.setData(const ClipboardData(text: userId))
                        .whenComplete(() => _showOverlay(context));
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            const UDivider(),
            const SizedBox(height: 16),
            const UText(
              'Enter your friend’s account ID or username, or scan their QR code to find their account. Account ID’s are case sensitive.',
              textStyle: UTextStyle.B1_body,
            ),
            const SizedBox(height: 24),
            _buildIDFormField(),
            const SizedBox(height: 56),
            UButton.primary(
              disabled: _disableButton,
              label: 'Search',
              uIconData: UIcons.search,
              onPressed: () async {
                if (_formfieldKey.currentState!.validate()) {
                } else {
                  // TODO(yijing): add search work flow
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  FormField<String> _buildIDFormField() {
    return FormField<String>(
      key: _formfieldKey,
      autovalidateMode: AutovalidateMode.disabled,
      validator: (value) {
        // TODO(yijing): update validator function
        if (value!.length < 43 && value.isNotEmpty) {
          return 'Error: not enough characters.';
        } else if (value.length == 43 &&
            value != 'pBr8xM9WKfbGnLK8EJEiKEivBhBos5EDdJv5Wzbib94') {
          return 'Error: no account found.';
        } else {
          return null;
        }
      },
      builder: (FormFieldState<String> state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: UColors.foregroundDark,
              ),
              child: TextField(
                onChanged: (value) {
                  setState(() {
                    if (value.isEmpty) {
                      _disableButton = true;
                    } else {
                      _disableButton = false;
                    }
                  });
                  state.didChange(value);
                },
                decoration: const InputDecoration(hintText: 'Enter Account ID'),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            if (state.hasError)
              UText(
                state.errorText.toString(),
                textStyle: UTextStyle.B1_body,
                textColor: UColors.termRed,
              )
          ],
        );
      },
    );
  }

  Future<void> _showOverlay(BuildContext context) async {
    final overlay = Overlay.of(context);
    final leftOffset = MediaQuery.of(context).size.width / 2 - 50;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        width: 72,
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: UColors.ctaBlue,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const UText(
                      'Copied!',
                      textStyle: UTextStyle.B1_body,
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
    _animationController.addListener(() {
      overlay?.setState(() {});
    });
    overlay?.insert(overlayEntry!);
    await _animationController.forward();
    await Future<void>.delayed(const Duration(milliseconds: 1250)).whenComplete(
      () => _animationController
          .reverse()
          .whenComplete(() => overlayEntry?.remove()),
    );
  }
}

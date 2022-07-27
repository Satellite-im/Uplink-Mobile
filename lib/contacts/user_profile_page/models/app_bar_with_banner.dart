import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/models_export.dart';

class AppBarWithBanner extends StatefulWidget {
  const AppBarWithBanner({
    Key? key,
    required this.user,
    this.backButtonOpacity,
    this.reduecdTopHeight,
    this.backButtonOnPressed,
  }) : super(key: key);

  final MockContact user;
  final double? backButtonOpacity;
  final double? reduecdTopHeight;
  final VoidCallback? backButtonOnPressed;

  @override
  State<AppBarWithBanner> createState() => _AppBarWithBannerState();
}

class _AppBarWithBannerState extends State<AppBarWithBanner> {
  late double _backButtonOpacity;
  late double _reduecdTopHeight;
  // TODO(laterYijing): get system status bar height
  @override
  void initState() {
    super.initState();
    if (widget.backButtonOpacity != null) {
      _backButtonOpacity = widget.backButtonOpacity!;
    } else {
      _backButtonOpacity = 1;
    }
    if (widget.reduecdTopHeight != null) {
      _reduecdTopHeight = widget.reduecdTopHeight!;
    } else {
      _reduecdTopHeight = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 164,
      decoration: const BoxDecoration(
        image: DecorationImage(
          // TODO(laterYijing): change to UImage
          image: AssetImage('lib/utils/mock/images/bannerImage1.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: AnimatedPadding(
          padding: EdgeInsets.only(top: 60 - _reduecdTopHeight),
          duration: const Duration(seconds: 1),
          child: Row(
            children: [
              AnimatedOpacity(
                opacity: _backButtonOpacity,
                duration: const Duration(seconds: 1),
                child: IconButton(
                  icon: const UIcon(
                    UIcons.back_arrow,
                    color: UColors.white,
                  ),
                  onPressed: widget.backButtonOnPressed ??
                      () => Navigator.of(context).pop(),
                ),
              ),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              if (widget.user.relationship == Relationship.block &&
                  widget.user.isBlocked == false)
                const UIcon(
                  UIcons.blocked_contacts,
                  color: UColors.textDark,
                ),
              if (widget.user.relationship == Relationship.friend &&
                  widget.user.isBlocked == false) ...[
                IconButton(
                  onPressed: () {},
                  icon: const UIcon(UIcons.voice_call),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const UIcon(UIcons.video_call),
                ),
              ],
              if (widget.user.relationship == Relationship.none &&
                  widget.user.friendRequestSent == true &&
                  widget.user.isBlocked == false)
                const UIcon(
                  UIcons.outgoing_requests,
                  color: UColors.textDark,
                ),
              //hamburger menu
              HamburgerMenuButton(
                user: widget.user,
              ),
              const SizedBox(width: 8),
            ],
          ),
        ),
      ),
    );
  }
}

class HamburgerMenuButton extends StatelessWidget {
  const HamburgerMenuButton({
    Key? key,
    required this.user,
  }) : super(key: key);

  final MockContact user;

  @override
  Widget build(BuildContext context) {
    var model = UAppStrings.block;
    if (user.relationship == Relationship.block) model = UAppStrings.unblock;

    return UPopupMenuButton<String>(
      icon: const UIcon(UIcons.hamburger_menu),
      onSelected: (String result) async {
        switch (result) {
          case 'Unblock':
            await showDialog<void>(
              context: context,
              builder: (_) => UDialogUserProfile(
                bodyText: UAppStrings.unblockDialogQ,
                buttonText: UAppStrings.unblock,
                popButtonText: UAppStrings.goBackButton,
                username: user.name,
                statusMessage: user.statusMessage,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                onTap: () {
                  // TODO(yijing): add unblock workflow
                },
              ),
            );
            break;
          case 'Block':
            await showDialog<void>(
              context: context,
              builder: (_) => UDialogUserProfile(
                bodyText: UAppStrings.blockDialogQ,
                buttonText: UAppStrings.block,
                popButtonText: UAppStrings.goBackButton,
                username: user.name,
                statusMessage: user.statusMessage,
                uImage: UImage(
                  imagePath: user.imageAddress,
                  imageSource: ImageSource.local,
                ),
                onTap: () {
                  // TODO(yijing): add block workflow
                },
              ),
            );
            break;
          case 'Report':
            // TODO(yijing): add report workflow
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return <UPopupMenuEntry<String>>[
          UPopupMenuItem<String>(
            padding: EdgeInsets.zero,
            value: model,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: UText(
                  model,
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.white,
                ),
              ),
            ),
          ),
          const UPopupMenuItem<String>(
            value: UAppStrings.report,
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: UText(
                  UAppStrings.report,
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.termRed,
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}

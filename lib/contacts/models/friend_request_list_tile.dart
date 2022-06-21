import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class FriendRequestListTile extends StatelessWidget {
  const FriendRequestListTile({
    Key? key,
    required this.name,
    this.statusMessage,
    this.imageAddress,
    required this.status,
    required this.onTap,
  }) : super(key: key);

  final String name;
  final String? statusMessage;
  final Status status;
  final String? imageAddress;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      leading: UUserProfileWithStatus(
        // TODO(yijing): update to online image in profuction app
        isLocalImage: true,
        imagePath: imageAddress,
        userProfileSize: UUserProfileSize.normal,
        status: status,
      ),
      horizontalTitleGap: 12,
      title: UText(
        name,
        textStyle: UTextStyle.H4_fourthHeader,
      ),
      subtitle: UText(
        statusMessage ?? '',
        textStyle: UTextStyle.B1_body,
        textColor: UColors.textMed,
      ),
      dense: true,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
      trailing: SizedBox(
        width: 90,
        child: Row(
          children: [
            _buildDecisionButton(false, () {
              UBottomSheetTwoButtons(
                context,
                header: 'Are you sure you want to remove this friend request?',
                firstButtonText: 'Cancel',
                firstButtonOnPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                secondButtonText: 'Remove',
                secondButtonColor: UColors.termRed,
                secondButtonOnPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  // TODO(yijing): add delete friend request function
                  showDialog<void>(
                    context: context,
                    builder: (dialogContext) => UDialogSingleButtonCustomBody(
                      title: 'Friend Request Deleted',
                      body: RichText(
                        text: TextSpan(
                          text: 'The friend request from ',
                          style: UTextStyle.B1_body.style.returnTextStyleType(),
                          children: <TextSpan>[
                            TextSpan(
                              text: name,
                              style: UTextStyle.H4_fourthHeader.style
                                  .returnTextStyleType(),
                            ),
                            const TextSpan(text: ' was deleted.'),
                          ],
                        ),
                      ),
                      buttonText: 'Okay',
                    ),
                  );
                },
              ).show();
            }),
            const SizedBox(width: 8),
            _buildDecisionButton(true, () {}),
          ],
        ),
      ),
    );
  }

  ///type ture is approve, type false is decline
  Ink _buildDecisionButton(bool type, Function() onTap) {
    return Ink(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: type == true ? UColors.ctaBlue : UColors.ctaDark,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        icon: UIcon(type == true ? UIcons.checkmark : UIcons.close_button),
        color: UColors.white,
        onPressed: onTap,
      ),
    );
  }
}

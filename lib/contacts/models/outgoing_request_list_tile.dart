import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class OutgoingRequestListTile extends StatelessWidget {
  const OutgoingRequestListTile({
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
      contentPadding: const EdgeInsets.only(left: 16),
      onTap: onTap,
      trailing: IconButton(
        onPressed: () {
          UBottomSheetTwoButtons(
            context,
            header: UAppStrings.outgoingRequestListTile_bottomSheetHeader,
            firstButtonText: UAppStrings.cancelButton,
            firstButtonOnPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            secondButtonText: UAppStrings.remove,
            secondButtonColor: UColors.termRed,
            secondButtonOnPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
              // TODO(yijing): add delete friend request function
              showDialog<void>(
                context: context,
                builder: (dialogContext) => UDialogSingleButtonCustomBody(
                  title: UAppStrings.outgoingRequestListTile_dialogTitle,
                  body: RichText(
                    text: TextSpan(
                      text: UAppStrings.outgoingRequestListTile_text1,
                      style: UTextStyle.B1_body.style.returnTextStyleType(),
                      children: <TextSpan>[
                        TextSpan(
                          text: name,
                          style: UTextStyle.H4_fourthHeader.style
                              .returnTextStyleType(),
                        ),
                        const TextSpan(
                          text: UAppStrings.outgoingRequestListTile_text2,
                        ),
                      ],
                    ),
                  ),
                  buttonText: 'Okay',
                ),
              );
            },
          ).show();
        },
        icon: const UIcon(
          UIcons.outgoing_requests,
          color: UColors.textDark,
        ),
      ),
    );
  }
}

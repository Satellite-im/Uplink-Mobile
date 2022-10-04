import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class OutgoingRequestListTile extends StatelessWidget {
  const OutgoingRequestListTile({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.transparent,
      leading: UUserProfileWithStatus(
        // TODO(yijing): update to online image in profuction app
        uImage: UImage(
          imagePath: user.profilePicture?.path,
          imageSource: ImageSource.file,
        ),
        userProfileSize: UUserProfileSize.normal,
        status: user.status ?? Status.offline,
      ),
      horizontalTitleGap: 12,
      title: UText(
        user.username,
        textStyle: UTextStyle.H4_fourthHeader,
      ),
      subtitle: UText(
        user.statusMessage ?? '',
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
              GetIt.I.get<FriendBloc>().add(CancelFriendRequestSent(user));
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
                          text: user.username,
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

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

class FriendRequestListTile extends StatelessWidget {
  const FriendRequestListTile({
    Key? key,
    required this.user,
    required this.onTap,
  }) : super(key: key);

  final User user;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final _friendController = GetIt.I.get<FriendBloc>();

    return ListTile(
      leading: UUserProfileWithStatus(
        // TODO(yijing): update to online image in profuction app
        uImage: UImage(
          imagePath: user.profilePicture?.path ?? '',
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      onTap: onTap,
      trailing: SizedBox(
        width: 90,
        child: Row(
          children: [
            _buildDecisionButton(false, () {
              UBottomSheetTwoButtons(
                context,
                header: UAppStrings.friendRequestListTile_bottomSheetHeader,
                firstButtonText: UAppStrings.cancelButton,
                firstButtonOnPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                },
                secondButtonText: UAppStrings.remove,
                secondButtonColor: UColors.termRed,
                secondButtonOnPressed: () {
                  Navigator.of(context, rootNavigator: true).pop();
                  _friendController.add(FriendRequestDenialStarted(user));
                  showDialog<void>(
                    context: context,
                    builder: (dialogContext) => UDialogSingleButtonCustomBody(
                      title: UAppStrings.friendRequestListTile_dialogTitle,
                      body: RichText(
                        text: TextSpan(
                          text: UAppStrings.friendRequestListTile_text1,
                          style: UTextStyle.B1_body.style.returnTextStyleType(),
                          children: <TextSpan>[
                            TextSpan(
                              text: user.username,
                              style: UTextStyle.H4_fourthHeader.style
                                  .returnTextStyleType(),
                            ),
                            const TextSpan(
                              text: UAppStrings.friendRequestListTile_text2,
                            ),
                          ],
                        ),
                      ),
                      buttonText: UAppStrings.okay,
                    ),
                  );
                },
              ).show();
            }),
            const SizedBox(width: 8),
            _buildDecisionButton(true, () {
              _friendController.add(FriendRequestAcceptanceStarted(user));
            }),
          ],
        ),
      ),
    );
  }

  ///type ture is approve, type false is decline
  Container _buildDecisionButton(bool type, Function() onTap) {
    return Container(
      width: 40,
      height: 40,
      decoration: ShapeDecoration(
        color: type == true ? UColors.ctaBlue : UColors.ctaDark,
        shape: const CircleBorder(),
      ),
      child: IconButton(
        icon: UIcon(type == true ? UIcons.checkmark_1 : UIcons.close),
        color: UColors.white,
        onPressed: onTap,
      ),
    );
  }
}

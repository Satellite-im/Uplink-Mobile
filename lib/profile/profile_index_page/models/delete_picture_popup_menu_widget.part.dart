part of '../profile_index_page.dart';

class _DeletePicturePopupMenu extends StatelessWidget {
  const _DeletePicturePopupMenu({
    Key? key,
    required this.removeAvatarOnPressed,
    required this.removeBannerOnPressed,
  }) : super(key: key);

  final Function() removeAvatarOnPressed;
  final Function() removeBannerOnPressed;

  @override
  Widget build(BuildContext context) {
    return UPopupMenuButton<String>(
      icon: const UIcon(UIcons.hamburger_menu),
      onSelected: (String result) {
        switch (result) {
          case UAppStrings.editProfilePage_removeAvatar:
            UBottomSheetTwoButtons(
              context,
              header: UAppStrings.editProfilePage_removeAvatarBottomSheet,
              firstButtonText: UAppStrings.cancelButton,
              secondButtonText: UAppStrings.remove,
              firstButtonColor: UColors.ctaDark,
              secondButtonColor: UColors.termRed,
              firstButtonOnPressed: () => Navigator.of(
                context,
                rootNavigator: true,
              ).pop(),
              secondButtonOnPressed: () {
                removeAvatarOnPressed();
                Navigator.of(context, rootNavigator: true).pop();
              },
            ).show();
            break;
          case UAppStrings.editProfilePage_removeBanner:
            UBottomSheetTwoButtons(
              context,
              header: UAppStrings.editProfilePage_removeBannerBottomSheet,
              firstButtonText: UAppStrings.cancelButton,
              secondButtonText: UAppStrings.remove,
              firstButtonColor: UColors.ctaDark,
              secondButtonColor: UColors.termRed,
              firstButtonOnPressed: () => Navigator.of(
                context,
                rootNavigator: true,
              ).pop(),
              secondButtonOnPressed: () {
                removeBannerOnPressed();
                Navigator.of(context, rootNavigator: true).pop();
              },
            ).show();
            break;
          default:
        }
      },
      itemBuilder: (BuildContext context) {
        return <UPopupMenuEntry<String>>[
          const UPopupMenuItem<String>(
            value: UAppStrings.editProfilePage_removeAvatar,
            child: UText(
              UAppStrings.editProfilePage_removeAvatar,
              textStyle: UTextStyle.BUT1_primaryButton,
              textColor: UColors.termRed,
            ),
          ),
          const UPopupMenuItem<String>(
            value: UAppStrings.editProfilePage_removeBanner,
            child: UText(
              UAppStrings.editProfilePage_removeBanner,
              textStyle: UTextStyle.BUT1_primaryButton,
              textColor: UColors.termRed,
            ),
          ),
        ];
      },
    );
  }
}

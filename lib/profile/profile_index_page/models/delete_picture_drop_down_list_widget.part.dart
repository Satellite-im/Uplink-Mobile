part of '../profile_index_page.dart';

class _DeletePictureDropDownList extends StatelessWidget {
  const _DeletePictureDropDownList({
    Key? key,
    required this.removeAvatarOnPressed,
    required this.removeBannerOnPressed,
  }) : super(key: key);

  final Function() removeAvatarOnPressed;
  final Function() removeBannerOnPressed;

  @override
  Widget build(BuildContext context) {
    return UPopupMenuButton<String>(
      color: UColors.foregroundDark,
      offset: const Offset(-16, 60),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
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
            padding: EdgeInsets.zero,
            value: UAppStrings.editProfilePage_removeAvatar,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: UText(
                  UAppStrings.editProfilePage_removeAvatar,
                  textStyle: UTextStyle.BUT1_primaryButton,
                  textColor: UColors.termRed,
                ),
              ),
            ),
          ),
          const UPopupMenuItem<String>(
            value: UAppStrings.editProfilePage_removeBanner,
            padding: EdgeInsets.zero,
            child: SizedBox(
              width: 160,
              child: Padding(
                padding: EdgeInsets.only(left: 16),
                child: UText(
                  UAppStrings.editProfilePage_removeBanner,
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

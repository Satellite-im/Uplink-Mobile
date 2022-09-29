part of 'qr_code_scanner_page.dart';

class _QRCodeScannerFeedbackDialogs {
  static void showUsersAreAlreadyFriendsDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        showPopButton: false,
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'You and ',
                style: UTextStyle.B1_body.style.returnTextStyleType(
                  color: UColors.white,
                ),
              ),
              TextSpan(
                text: user.username,
                style: UTextStyle.H3_tertiaryHeader.style.returnTextStyleType(
                  color: UColors.white,
                ),
              ),
              TextSpan(
                text: ' are already friends!',
                style: UTextStyle.B1_body.style.returnTextStyleType(
                  color: UColors.white,
                ),
              ),
            ],
          ),
        ),
        popButtonText: UAppStrings.goBackButton,
        username: user.username,
        statusMessage: user.statusMessage,
        uImage: UImage(
          imagePath: user.profilePicture?.path,
          imageSource: ImageSource.file,
          fit: BoxFit.cover,
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    );
  }

  static void showOtherUserAlreadySentFriendRequestDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children:
                UAppStrings.userAlreadySentYouAFriendRequestBodyDialog(user),
          ),
        ),
        popButtonText: UAppStrings.goBackButton,
        username: user.username,
        statusMessage: user.statusMessage,
        uImage: UImage(
          imagePath: user.profilePicture?.path,
          imageSource: ImageSource.file,
          fit: BoxFit.cover,
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    );
  }

  static void showCurrentUserSentFriendRequestDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        showPopButton: false,
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: UAppStrings.currentUserSentFriendRequestBodyDialog(user),
          ),
        ),
        popButtonText: UAppStrings.goBackButton,
        username: user.username,
        statusMessage: user.statusMessage,
        uImage: UImage(
          imagePath: user.profilePicture?.path,
          imageSource: ImageSource.file,
          fit: BoxFit.cover,
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    );
  }

  static void showSendFriendRequestToOtherUserDialog(
    BuildContext context,
    User user,
    FriendBloc _friendController, {
    required VoidCallback onTap,
    required VoidCallback onPopButtonTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => BlocBuilder<FriendBloc, FriendState>(
        bloc: _friendController,
        builder: (context, state) {
          if (state is FriendLoadSuccess) {
            return UDialogUserProfile(
              bodyText: '',
              useBodyRichText: true,
              bodyRichText: RichText(
                text: TextSpan(
                  children:
                      UAppStrings.sendFriendRequestToOtherUserBodyDialog(user),
                ),
              ),
              popButtonText: UAppStrings.goBackButton,
              popButtonOnTap: onPopButtonTap,
              username: state.user!.username,
              statusMessage: state.user!.statusMessage,
              uImage: UImage(
                imagePath: state.user!.profilePicture?.path,
                imageSource: ImageSource.file,
                fit: BoxFit.cover,
              ),
              buttonText: UAppStrings.qrCodePage_addFriendDialogButtonText,
              onTap: onTap,
            );
          } else if (state is FriendLoadFailure) {
            Navigator.of(context).pop();
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  static void showFriendRequestSentDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        showPopButton: false,
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: UAppStrings.friendRequestSentBodyDialog(user),
          ),
        ),
        popButtonText: UAppStrings.goBackButton,
        username: user.username,
        statusMessage: user.statusMessage,
        uImage: UImage(
          imagePath: user.profilePicture?.path,
          imageSource: ImageSource.file,
          fit: BoxFit.cover,
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    );
  }

  static void showErrorInvalidQRCodeDialog(
    BuildContext context, {
    required VoidCallback onPopButtonTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogSingleButton(
        title: UAppStrings.qrCodeScannerPage_errorInvalidQRCodeDialogTitle,
        bodyText: UAppStrings.qrCodeScannerPage_errorInvalidQRCodeDialogBody,
        buttonText: UAppStrings.okay,
        onPop: onPopButtonTap,
      ),
    );
  }

  static void showErrorAccountNotFoundDialog(
    BuildContext context, {
    required VoidCallback onPopButtonTap,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogSingleButton(
        title: UAppStrings.qrCodeScannerPage_errorAccountNotFoundDialogTitle,
        bodyText: UAppStrings.qrCodeScannerPage_errorAccountNotFoundDialogBody,
        buttonText: UAppStrings.okay,
        onPop: onPopButtonTap,
      ),
    );
  }
}

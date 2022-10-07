part of 'qr_code_scanner_page.dart';

class _QRCodeScannerFeedbackDialogs {
  static void showUsersAreAlreadyFriendsDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        showPopButton: false,
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: UAppStrings.qrCodeScannerPage_friendsDialodFirst,
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
                text: UAppStrings.qrCodeScannerPage_friendsDialodSecond,
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
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showOtherUserAlreadySentFriendRequestDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: user.username,
                style: UTextStyle.H3_tertiaryHeader.style.returnTextStyleType(
                  color: UColors.white,
                ),
              ),
              TextSpan(
                text: UAppStrings.qrCodeScannerPage_incomingFriendRequestDialog,
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
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showUserIsBlocked(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: UAppStrings.qrCodeScannerPage_userIsBlockedDialogFirst,
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
                text: UAppStrings.qrCodeScannerPage_userIsBlockedDialogSecond,
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
        ),
        buttonText: UAppStrings.addFriend,
        onTap: onTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showCurrentUserSentFriendRequestDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        showPopButton: false,
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: UAppStrings.qrCodeScannerPage_outgoingFriendRequestDialog,
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
            ],
          ),
        ),
        popButtonText: UAppStrings.goBackButton,
        username: user.username,
        statusMessage: user.statusMessage,
        uImage: UImage(
          imagePath: user.profilePicture?.path,
          imageSource: ImageSource.file,
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showSendFriendRequestToOtherUserDialog(
    BuildContext context,
    User user,
    FriendBloc _friendController, {
    required VoidCallback onTap,
    required VoidCallback onPopButtonTap,
    required VoidCallback onCloseDialog,
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
                  children: [
                    TextSpan(
                      text: UAppStrings
                          .qrCodeScannerPage_sendFriendRequestDialogFirst,
                      style: UTextStyle.B1_body.style.returnTextStyleType(
                        color: UColors.white,
                      ),
                    ),
                    TextSpan(
                      text: user.username,
                      style: UTextStyle.H3_tertiaryHeader.style
                          .returnTextStyleType(
                        color: UColors.white,
                      ),
                    ),
                    TextSpan(
                      text: UAppStrings
                          .qrCodeScannerPage_sendFriendRequestDialogSecond,
                      style: UTextStyle.B1_body.style.returnTextStyleType(
                        color: UColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              popButtonText: UAppStrings.goBackButton,
              popButtonOnTap: onPopButtonTap,
              username: state.user!.username,
              statusMessage: state.user!.statusMessage,
              uImage: UImage(
                imagePath: state.user!.profilePicture?.path,
                imageSource: ImageSource.file,
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
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showFriendRequestSentDialog(
    BuildContext context,
    User user, {
    required VoidCallback onTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogUserProfile(
        showPopButton: false,
        bodyText: '',
        useBodyRichText: true,
        bodyRichText: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: UAppStrings.qrCodeScannerPage_friendRequestSentDialog,
                style: UTextStyle.B1_body.style.returnTextStyleType(
                  color: UColors.white,
                ),
              ),
              TextSpan(
                text: '${user.username}!',
                style: UTextStyle.H3_tertiaryHeader.style.returnTextStyleType(
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
        ),
        buttonText: UAppStrings.okay,
        onTap: onTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showErrorInvalidQRCodeDialog(
    BuildContext context, {
    required VoidCallback onPopButtonTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogSingleButton(
        title: UAppStrings.qrCodeScannerPage_errorInvalidQRCodeDialogTitle,
        bodyText: UAppStrings.qrCodeScannerPage_errorInvalidQRCodeDialogBody,
        buttonText: UAppStrings.okay,
        onPop: onPopButtonTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }

  static void showErrorAccountNotFoundDialog(
    BuildContext context, {
    required VoidCallback onPopButtonTap,
    required VoidCallback onCloseDialog,
  }) {
    showDialog<void>(
      context: context,
      builder: (context) => UDialogSingleButton(
        title: UAppStrings.qrCodeScannerPage_errorAccountNotFoundDialogTitle,
        bodyText: UAppStrings.qrCodeScannerPage_errorAccountNotFoundDialogBody,
        buttonText: UAppStrings.okay,
        onPop: onPopButtonTap,
      ),
    ).then((value) {
      onCloseDialog.call();
    });
  }
}

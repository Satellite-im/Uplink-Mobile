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
            children: UAppStrings.usersAreAlreadyFriendsBodyDialog(user),
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

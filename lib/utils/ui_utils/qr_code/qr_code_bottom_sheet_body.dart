part of 'qr_code_bottom_sheet.dart';

class _QRCodeBottomSheet extends StatelessWidget {
  const _QRCodeBottomSheet({
    Key? key,
    required this.currentUser,
    required this.isPage,
    required this.showAppBar,
    required this.isHalfPage,
    required this.fullPageLoaded,
    required this.animationController,
  }) : super(key: key);

  final CurrentUser currentUser;
  final bool isPage;
  final bool showAppBar;
  final bool isHalfPage;
  final bool fullPageLoaded;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    const _duration = Duration(milliseconds: 100);

    return AnimatedContainer(
      duration: _duration,
      decoration: !showAppBar
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: UColors.modalDark,
            )
          : const BoxDecoration(
              color: UColors.backgroundDark,
            ),
      child: Column(
        children: [
          AnimatedContainer(
            duration: _duration,
            height: showAppBar ? AppBar().preferredSize.height : 0,
            child: UAppBar.back(
              title: UAppStrings.qrCodePage_appBarTitle,
              cancelCloseFunctionInBackButton: true,
              onBackPressed: () {
                if (fullPageLoaded) {
                  animationController.forward().whenComplete(
                        () => Navigator.of(context).pop(),
                      );
                }
              },
            ),
          ),
          AnimatedContainer(
            duration: _duration,
            height: showAppBar
                ? 48
                : isPage
                    ? 64
                    : 0,
            width: isPage ? (_screenSize.width) : 0,
            child: AnimatedPadding(
              duration: _duration,
              padding: showAppBar
                  ? const EdgeInsets.fromLTRB(16, 8, 16, 0)
                  : const EdgeInsets.fromLTRB(16, 30, 16, 0),
              child: const UText(
                UAppStrings.qrCodePage_pageDescription,
                textStyle: UTextStyle.B1_body,
              ),
            ),
          ),
          AnimatedPadding(
            duration: _duration,
            padding: isPage
                ? const EdgeInsets.only(top: 24)
                : const EdgeInsets.only(top: 30),
            child: Center(
              child: UUserProfile(
                secondUserProfileSize: UUserProfileSize.large,
                isFirstSize: !isHalfPage,
                sizeAnimationDuration: _duration,
                userProfileSize: UUserProfileSize.normal,
                uImage: UImage(
                  imagePath: currentUser.profilePicture?.path,
                  imageSource: ImageSource.file,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: _duration,
            height: isHalfPage ? 16 : 12,
          ),
          UText(
            currentUser.username,
            textStyle: UTextStyle.H2_secondaryHeader,
          ),
          const SizedBox.square(
            dimension: 2,
          ),
          UText(
            currentUser.statusMessage ?? '',
            textStyle: UTextStyle.B1_body,
          ),
          AnimatedContainer(
            duration: _duration,
            height: isHalfPage ? 32 : 24,
          ),
          AnimatedPadding(
            duration: _duration,
            padding: isHalfPage
                ? const EdgeInsets.symmetric(horizontal: 36)
                : const EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const UIcon(
                  UIcons.qr_code_scanner_border,
                  color: UColors.textMed,
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationY(math.pi),
                  child: const UIcon(
                    UIcons.qr_code_scanner_border,
                    color: UColors.textMed,
                  ),
                )
              ],
            ),
          ),
          AnimatedContainer(
            duration: _duration,
            height: isHalfPage ? 240 : 172,
            width: isHalfPage ? 240 : 172,
            child: const UQRCode(
              qrCodeData: UAppStrings.profileIndexPage_qrCodeData,
            ),
          ),
          AnimatedPadding(
            duration: _duration,
            padding: isHalfPage
                ? const EdgeInsets.symmetric(horizontal: 36)
                : const EdgeInsets.symmetric(horizontal: 70),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationX(math.pi),
                  child: const UIcon(
                    UIcons.qr_code_scanner_border,
                    color: UColors.textMed,
                  ),
                ),
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(math.pi),
                  child: const UIcon(
                    UIcons.qr_code_scanner_border,
                    color: UColors.textMed,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox.square(
            dimension: 56,
          ),
          AnimatedOpacity(
            duration: _duration,
            opacity: showAppBar ? 1 : 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: double.infinity,
                child: UButton.primary(
                  label: UAppStrings.qrCodePage_buttonText,
                  uIconData: UIcons.camera,
                  onPressed: () {
                    // TODO(Lucas): add function here later
                  },
                ),
              ),
            ),
          ),
          SizedBox.square(
            dimension: showAppBar ? 20 : _screenSize.height / 2,
          ),
        ],
      ),
    );
  }
}

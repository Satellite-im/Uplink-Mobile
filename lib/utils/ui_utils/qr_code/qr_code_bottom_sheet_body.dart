part of 'qr_code_page.dart';

class _QRCodeBottomSheet extends StatelessWidget {
  const _QRCodeBottomSheet({
    Key? key,
    required this.currentUser,
    required this.isPage,
    required this.showAppBar,
  }) : super(key: key);

  final MockCurrentUser currentUser;
  final bool isPage;
  final bool showAppBar;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    const _duration = Duration(milliseconds: 200);

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
            ),
          ),
          AnimatedSize(
            duration: _duration,
            child: isPage
                ? const Padding(
                    padding: EdgeInsets.fromLTRB(16, 8, 16, 0),
                    child: UText(
                      UAppStrings.qrCodePage_pageDescription,
                      textStyle: UTextStyle.B1_body,
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          AnimatedPadding(
            duration: _duration,
            padding: isPage
                ? const EdgeInsets.only(top: 24)
                : const EdgeInsets.only(top: 30),
            child: Center(
              child: AnimatedSize(
                duration: _duration,
                child: UUserProfile(
                  userProfileSize:
                      isPage ? UUserProfileSize.large : UUserProfileSize.normal,
                  uImage: UImage(
                    imagePath: currentUser.imageAddress,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          AnimatedContainer(
            duration: _duration,
            height: isPage ? 16 : 12,
          ),
          // const SizedBox.square(
          //   dimension: 12,
          // ),
          const UText(
            UAppStrings.profileIndexPage_username,
            textStyle: UTextStyle.H2_secondaryHeader,
          ),
          const SizedBox.square(
            dimension: 2,
          ),
          const UText(
            UAppStrings.profileIndexPage_statusMessage,
            textStyle: UTextStyle.B1_body,
          ),
          // const SizedBox.square(
          //   dimension: 24,
          // ),
          AnimatedContainer(
            duration: _duration,
            height: isPage ? 32 : 24,
          ),
          AnimatedPadding(
            duration: _duration,
            padding: isPage
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
            height: isPage ? 240 : 172,
            width: isPage ? 240 : 172,
            child: const UQRCode(
              qrCodeData: UAppStrings.profileIndexPage_qrCodeData,
            ),
          ),
          AnimatedPadding(
            duration: _duration,
            padding: isPage
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

part of 'qr_code_page.dart';

class _QRCodeFullPage extends StatelessWidget {
  const _QRCodeFullPage({
    Key? key,
    required this.showAppBar,
    required this.currentUser,
  }) : super(key: key);

  final bool showAppBar;
  final MockCurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (showAppBar)
          UAppBar.back(
            title: UAppStrings.qrCodePage_appBarTitle,
          ),
        const SizedBox.square(
          dimension: 16,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: UText(
            UAppStrings.qrCodePage_pageDescription,
            textStyle: UTextStyle.B1_body,
          ),
        ),
        const SizedBox.square(dimension: 32),
        Center(
          child: UUserProfile(
            uImage: UImage(
              imagePath: currentUser.imageAddress,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox.square(
          dimension: 16,
        ),
        const Center(
          child: UText(
            UAppStrings.profileIndexPage_username,
            textStyle: UTextStyle.H2_secondaryHeader,
          ),
        ),
        const SizedBox.square(
          dimension: 2,
        ),
        const Center(
          child: UText(
            UAppStrings.profileIndexPage_statusMessage,
            textStyle: UTextStyle.B1_body,
          ),
        ),
        const SizedBox.square(
          dimension: 32,
        ),
        const _QRCode(),
        const SizedBox.square(
          dimension: 56,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SizedBox(
            width: double.infinity,
            child: UButton.primary(
              label: UAppStrings.qrCodePage_buttonText,
              uIconData: UIcons.camera,
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox.square(
          dimension: 20,
        ),
      ],
    );
  }
}

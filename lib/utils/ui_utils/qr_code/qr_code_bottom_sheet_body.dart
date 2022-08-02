part of 'qr_code_page.dart';

class _QRCodeBottomSheet extends StatelessWidget {
  const _QRCodeBottomSheet({Key? key, required this.currentUser})
      : super(key: key);

  final MockCurrentUser currentUser;

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: UColors.modalDark,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(70, 30, 70, 37),
        child: Column(
          children: [
            Center(
              child: UUserProfile(
                uImage: UImage(
                  imagePath: currentUser.imageAddress,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox.square(
              dimension: 12,
            ),
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
            const SizedBox.square(
              dimension: 24,
            ),
            Row(
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
            const SizedBox.square(
              dimension: 172,
              child: UQRCode(
                qrCodeData: UAppStrings.profileIndexPage_qrCodeData,
              ),
            ),
            Row(
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
            SizedBox.square(
              dimension: _screenSize.height / 2,
            ),
          ],
        ),
      ),
    );
  }
}

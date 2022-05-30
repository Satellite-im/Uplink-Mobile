part of '../onboard_recovery_seed_page.dart';

class _ScreenShotRecoverySeedBoxes extends StatelessWidget {
  const _ScreenShotRecoverySeedBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: UColors.backgroundDark,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              children: const [
                SizedBox.square(
                  dimension: 32,
                ),
                UText(
                  'Save this in a safe place or write it down. To recover your '
                  'account, you’ll need your 12 passphrases '
                  'in the order that they '
                  'appear. Please do not share these passphrases with anybody.',
                  textStyle: UTextStyle.B1_body,
                ),
                SizedBox.square(
                  dimension: 24,
                ),
                _RecoverySeedBoxes(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
                  UAppStrings.recoverySeedPage_screenshotAdvice,
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

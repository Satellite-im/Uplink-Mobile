// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/onboard_recovery_seed_page/onboard_recovery_seed_page.dart';

class OnboardCreateAccountPage extends StatefulWidget {
  const OnboardCreateAccountPage({Key? key}) : super(key: key);

  @override
  State<OnboardCreateAccountPage> createState() =>
      _OnboardCreateAccountPageState();
}

class _OnboardCreateAccountPageState extends State<OnboardCreateAccountPage> {
  bool storedPin = false;
  bool allowedNotificaiton = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(
        title: 'Create Account',
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const UText(
                    'We’re going to create an account for you. On the next screen, you’ll see a set of words. Screenshot this or write it down.',
                    textStyle: UTextStyle.B1_body,
                  ),
                  const UText(
                    'This is the only way to back up your account.',
                    textStyle: UTextStyle.B1_body,
                    textColor: UColors.termRed,
                  ),
                  const SizedBox(height: 89),
                  UButton.primary(
                    label: 'Create Account',
                    uIconData: UIcons.menu_bar_contacts,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (context) => const OnboardRecoverySeedPage(),
                        ),
                      );
                    },
                  ),
                  UButton.secondary(
                    label: 'Import Account',
                    uIconData: UIcons.import,
                    onPressed: () {
                      // TODO(yijing): Import Account Pages
                    },
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
            Column(
              children: [
                const Divider(
                  color: UColors.foregroundDark,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UText(
                          'Store Pin? (Less Secure)',
                          textStyle: UTextStyle.H5_fifthHeader,
                        ),
                        USwitcher(
                          switchValue: storedPin,
                          onSwitch: (value) {
                            storedPin = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: UColors.foregroundDark,
                  indent: 0,
                  endIndent: 0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const UText(
                          'Allow Notifications',
                          textStyle: UTextStyle.H5_fifthHeader,
                        ),
                        USwitcher(
                          switchValue: storedPin,
                          onSwitch: (value) {
                            allowedNotificaiton = value;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}

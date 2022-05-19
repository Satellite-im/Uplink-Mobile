// ignore_for_file: lines_longer_than_80_chars, unused_local_variable

import 'dart:async';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/auth_export.dart';

List<String> _seedList = [
  'art',
  'bus',
  'drink',
  'frost',
  'hour',
  'cute',
  'fly',
  'frost',
  'hour',
  'grow',
  'join',
  'paint'
];

class OnboardRecoverySeedPage extends StatefulWidget {
  const OnboardRecoverySeedPage({Key? key}) : super(key: key);

  @override
  State<OnboardRecoverySeedPage> createState() =>
      _OnboardRecoverySeedPageState();
}

class _OnboardRecoverySeedPageState extends State<OnboardRecoverySeedPage> {
  final screenshotController = ScreenshotController();
  @override
  Widget build(BuildContext context) {
    return Screenshot<Widget>(
      controller: screenshotController,
      child: Scaffold(
        appBar: UAppBar.back(title: 'Recovery Seed'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const UText(
                  'Write this down in the order that they appear. Having the correct order is crucial when you are recovering your account.',
                  textStyle: UTextStyle.B1_body,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 330,
                  child: CustomScrollView(
                    physics: const NeverScrollableScrollPhysics(),
                    slivers: [
                      SliverGrid.count(
                        crossAxisCount: 2,
                        childAspectRatio: 160 / 40,
                        mainAxisSpacing: 8,
                        crossAxisSpacing: 8,
                        children: List.generate(
                          12,
                          (index) => Center(
                            child: URecoverySeedBox(
                              word: _seedList[index],
                              wordNumber: index + 1,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                UButton.primary(
                  label: 'I Saved It',
                  uIconData: UIcons.checkmark_rounded,
                  onPressed: () {
                    UBottomSheetTwoButtons(
                      context,
                      firstButtonOnPressed: () {
                        Navigator.pop(context);
                      },
                      secondButtonOnPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                const OnboardPrivacySettingFirstPage(),
                          ),
                        );
                      },
                      header: '''
    Are you sure you want to continue
    (You can view your passphrase from your account settings)''',
                      firstButtonText: 'Go Back',
                      secondButtonText: 'Continue',
                    ).show();
                  },
                ),
                UButton.secondary(
                  label: 'Screenshot',
                  uIconData: UIcons.camera,
                  onPressed: () async {
                    final image = await screenshotController.capture(
                      delay: const Duration(milliseconds: 200),
                    );
                    if (image == null) return;
                    if (!mounted) return;
                    await UBottomSheetTwoButtons(
                      context,
                      header: '''
Screenshot captured!
Would you like to give Satellite.im access to your camera roll?''',
                      firstButtonText: 'Cancel',
                      firstButtonOnPressed: () {
                        Navigator.pop(context);
                      },
                      secondButtonText: 'Agree',
                      secondButtonOnPressed: () async {
                        await saveImage(image)
                            .then((value) => Navigator.pop(context));
                      },
                    ).show();
                  },
                ),
                Expanded(child: Container())
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> saveImage(Uint8List image) async {
    await [Permission.storage].request();
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(':', '-');
    final name = 'uplink_$time';
    await ImageGallerySaver.saveImage(image, name: name);
  }
}

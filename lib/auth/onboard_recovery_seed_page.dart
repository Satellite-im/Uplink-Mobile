// ignore_for_file: lines_longer_than_80_chars, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_dialog/u_dialog_export.dart';
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
  bool _isRecoverySeedWordsSaved = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: 'Recovery Seed'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UText(
                'Write this down in the order that they appear. Having the correct order is crucial when you are recovering your account.',
                textStyle: UTextStyle.B1_body,
              ),
              const SizedBox(height: 24),
              const _RecoverySeedBoxes(),
              const SizedBox(height: 48),
              UButton.primary(
                label: 'I Saved It',
                uIconData: UIcons.checkmark_rounded,
                onPressed: () {
                  if (!_isRecoverySeedWordsSaved) {
                    UBottomSheetTwoButtons(
                      context,
                      firstButtonOnPressed: () {
                        Navigator.pop(context);
                      },
                      secondButtonOnPressed: () {
                        Navigator.pop(context);
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
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute<void>(
                        builder: (context) =>
                            const OnboardPrivacySettingFirstPage(),
                      ),
                    );
                  }
                },
              ),
              UButton.secondary(
                label: 'Screenshot',
                uIconData: UIcons.camera,
                onPressed: () async {
                  final _uScreenShot = UScreenShot();
                  final _uSaveImageOnGallery = USaveImageOnGallery();
                  final _image = await _uScreenShot.captureFromWidget(
                    context,
                    widget: const _ScreenShotRecoverySeedBoxes(),
                    delay: const Duration(milliseconds: 200),
                  );

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
                      await _uSaveImageOnGallery
                          .saveImage(
                        context,
                        _image,
                        nameComplement: 'recovery_seed_words_2',
                      )
                          .then((value) async {
                        _isRecoverySeedWordsSaved = value;
                        Navigator.pop(context);
                        await _savedScreenShotDialog(context)
                            .showUDialog<UDialog>();
                      });
                    },
                  ).show();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  UDialog _savedScreenShotDialog(BuildContext context) {
    return UDialog(
      context,
      title: 'Saved!',
      actions: [],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const UText(
            'This screenshot was saved to your phone gallery.',
            textStyle: UTextStyle.B1_body,
          ),
          const SizedBox.square(
            dimension: 16,
          ),
          Row(
            children: [
              Expanded(
                child: UButton.filled1(
                  label: 'Okay',
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ScreenShotRecoverySeedBoxes extends StatelessWidget {
  const _ScreenShotRecoverySeedBoxes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        SizedBox.square(
          dimension: 32,
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: UText(
            'Save this in a safe place or write it down. To recover your account, you’ll need your 12 passphrases in the order that they appear. Please do not share these passphrases with anybody.',
            textStyle: UTextStyle.B1_body,
          ),
        ),
        SizedBox.square(
          dimension: 24,
        ),
        _RecoverySeedBoxes(),
      ],
    );
  }
}

class _RecoverySeedBoxes extends StatelessWidget {
  const _RecoverySeedBoxes({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
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
    );
  }
}

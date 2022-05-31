// ignore_for_file: lines_longer_than_80_chars, unused_local_variable

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_dialog/u_dialog_export.dart';
import 'package:uplink/auth/auth_export.dart';

part 'models/recovery_seed_boxes_part.dart';
part 'models/screenshot_recovery_seed_boxes_part.dart';

class OnboardRecoverySeedPage extends StatefulWidget {
  const OnboardRecoverySeedPage({Key? key}) : super(key: key);

  @override
  State<OnboardRecoverySeedPage> createState() =>
      _OnboardRecoverySeedPageState();
}

class _OnboardRecoverySeedPageState extends State<OnboardRecoverySeedPage> {
  bool _isRecoverySeedWordsSaved = false;
  final _isLoading = ValueNotifier(false);

  @override
  void dispose() {
    _isLoading.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return UActionLoading(
      dashLoadingIndicatorPadding: const EdgeInsets.only(left: 48),
      isLoading: _isLoading,
      child: Scaffold(
        appBar: UAppBar.back(title: 'Recovery Seed'),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
            child: ListView(
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
                          Navigator.of(context)
                            ..pop()
                            ..push(
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
                    _isLoading.value = true;

                    final _uScreenShot = UScreenShot();
                    final _uSaveImageOnGallery = USaveImageOnGallery();

                    final _image = await _uScreenShot.captureFromWidget(
                      context,
                      widget: const _ScreenShotRecoverySeedBoxes(),
                    );

                    _isLoading.value = false;
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
                          imageNameToSave: 'recovery_seed_words',
                        )
                            .then((value) async {
                          _isRecoverySeedWordsSaved = value;
                          Navigator.pop(context);
                          if (_isRecoverySeedWordsSaved) {
                            await _savedScreenShotDialog(context)
                                .showUDialog<UDialog>();
                          }
                        });
                      },
                    ).show();
                  },
                ),
              ],
            ),
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
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

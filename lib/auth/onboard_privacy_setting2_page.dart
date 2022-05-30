import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class OnboardPrivacySettingSecondPage extends StatefulWidget {
  const OnboardPrivacySettingSecondPage({Key? key}) : super(key: key);

  @override
  State<OnboardPrivacySettingSecondPage> createState() =>
      _OnboardPrivacySettingSecondPageState();
}

class _OnboardPrivacySettingSecondPageState
    extends State<OnboardPrivacySettingSecondPage> {
  List<String> items = [
    'Satellite.im + Public Signaling Servers',
    'Title',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(title: UAppStrings.privacySetting_appBarTitle),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UText(
                UAppStrings.privacySettingSecondPage_subTitle,
                textStyle: UTextStyle.H3_tertiaryHeader,
              ),
              const SizedBox(height: 12),
              const UText(
                UAppStrings.privacySettingSecondPage_pageDescription,
                textStyle: UTextStyle.B1_body,
              ),
              const SizedBox(height: 56),
              Align(
                alignment: Alignment.centerLeft,
                child: UDropDownMenu(
                  items: items,
                  onSelectedItem: (value, index) {},
                ),
              ),
              const SizedBox(height: 56),
              UButton.filled1(
                label: UAppStrings.continueButton,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/auth/presentation/view/view_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class OnboardPrivacySettingFirstPage extends StatefulWidget {
  const OnboardPrivacySettingFirstPage({Key? key}) : super(key: key);

  @override
  State<OnboardPrivacySettingFirstPage> createState() =>
      _OnboardPrivacySettingFirstPageState();
}

class _OnboardPrivacySettingFirstPageState
    extends State<OnboardPrivacySettingFirstPage> {
  bool isRegisterUsernamePublicly = false;
  bool isEnableExternalEmbeds = false;
  bool isDisplayCurrentActivity = false;
  final _authController = GetIt.I.get<AuthBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(
        title: UAppStrings.privacySetting_appBarTitle,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: ListView(
            children: [
              const UText(
                UAppStrings.privacySettingFirstPage_chooseWhichFeaturesToEnable,
                textStyle: UTextStyle.B1_body,
              ),
              const SizedBox.square(
                dimension: 24,
              ),
              SizedBox(
                height: 500,
                child: ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    _buildSettingListTile(
                      disabled: true,
                      title:
                          UAppStrings.privacySettingFirstPage_firstOptionTitle,
                      subTitle: UAppStrings
                          .privacySettingFirstPage_firstOptionSubTitle,
                      switchValue: isRegisterUsernamePublicly,
                      onSwitch: (value) {
                        isRegisterUsernamePublicly = value;
                      },
                    ),
                    _buildSettingListTile(
                      title:
                          UAppStrings.privacySettingFirstPage_secondOptionTitle,
                      subTitle: UAppStrings
                          .privacySettingFirstPage_secondOptionSubTitle,
                      switchValue: _authController.storePin,
                      onSwitch: (value) {
                        _authController.storePin = value;
                      },
                    ),
                    _buildSettingListTile(
                      title:
                          UAppStrings.privacySettingFirstPage_thirdOptionTitle,
                      subTitle: UAppStrings
                          .privacySettingFirstPage_thirdOptionSubTitle,
                      switchValue: isEnableExternalEmbeds,
                      onSwitch: (value) {
                        isEnableExternalEmbeds = value;
                      },
                    ),
                    _buildSettingListTile(
                      title:
                          UAppStrings.privacySettingFirstPage_fourthOptionTitle,
                      subTitle: UAppStrings
                          .privacySettingFirstPage_fourthOptionSubTitle,
                      switchValue: isDisplayCurrentActivity,
                      onSwitch: (value) {
                        isDisplayCurrentActivity = value;
                      },
                    ),
                  ],
                ),
              ),
              UButton.filled1(
                label: UAppStrings.continueButton,
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) =>
                          const OnboardPrivacySettingSecondPage(),
                    ),
                  );
                },
              ),
              const SizedBox.square(
                dimension: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile _buildSettingListTile({
    bool? disabled,
    required String title,
    required String subTitle,
    required bool switchValue,
    required Function(bool) onSwitch,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.fromLTRB(0, 0, 0, 28),
      title: UText(
        title,
        textStyle: UTextStyle.H3_tertiaryHeader,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.fromLTRB(0, 12, 20, 0),
        child: UText(
          subTitle,
          textStyle: UTextStyle.B1_body,
        ),
      ),
      isThreeLine: true,
      trailing: USwitcher(
        disabled: disabled ?? false,
        switchValue: switchValue,
        onSwitch: onSwitch,
      ),
    );
  }
}

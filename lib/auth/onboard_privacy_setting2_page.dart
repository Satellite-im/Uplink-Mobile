import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/linking_satelittes_page.dart';

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
      appBar: UAppBar.back(title: 'Privacy Settings'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const UText(
                'Signaling Servers',
                textStyle: UTextStyle.H3_tertiaryHeader,
              ),
              const SizedBox(height: 12),
              const UText(
                '''
Choose which signaling server group you want to use.

If you use ‘Satellite.im + Public Signaling Servers’, you are using public servers and Satellite.im hosted servers to connect with your friends. We do not track connections. We only track server utilization (memory and cpu usage) to know if we need to turn on more signaling servers.

If you opt to use ‘Only Public Signaling Servers’, those are completely outside of Satellite.im control, so we cannot see any insight into their operation, logging, or data sharing practices. You may experience difficulties connecting with friends if the signaling servers are overloaded.
''',
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
                label: 'Continue',
                onPressed: () {
                  // TODO(Navigation): Change this for CreateProfileChange after merge
                  Navigator.of(context).push(
                    MaterialPageRoute<void>(
                      builder: (context) => const LinkingSatellitesPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class USwitcherPage extends StatelessWidget {
  const USwitcherPage({Key? key}) : super(key: key);

  static const routeName = '/USwitcher';

  @override
  Widget build(BuildContext context) {
    bool _switchValue = false;

    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const SizedBox.square(
              dimension: 16,
            ),
            const UText(
              'Switcher',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            Center(
              child: USwitcher(
                disabled: true,
                switchValue: _switchValue,
                onSwitch: (value) {
                  _switchValue = value;
                },
              ),
            ),
            Center(
              child: USwitcher(
                disabled: false,
                switchValue: _switchValue,
                onSwitch: (value) {
                  _switchValue = value;
                },
              ),
            ),
            Center(
              child: USwitcher(
                disabled: false,
                switchValue: _switchValue,
                onSwitch: (value) {
                  _switchValue = value;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

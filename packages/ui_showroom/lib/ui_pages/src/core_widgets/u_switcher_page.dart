import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class USwitcherPage extends StatefulWidget {
  const USwitcherPage({Key? key}) : super(key: key);

  static const routeName = '/USwitcher';

  @override
  State<USwitcherPage> createState() => _USwitcherPageState();
}

class _USwitcherPageState extends State<USwitcherPage> {
  bool _firstSwitcherValue = false;
  bool _secondSwitcherValue = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(USwitcherPage.routeName.substring(1)),
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
              'Switcher Disabled',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            const SizedBox.square(
              dimension: 8,
            ),
            Center(
              child: USwitcher(
                disabled: true,
                switchValue: _firstSwitcherValue,
                onSwitch: (value) {
                  _firstSwitcherValue = value;
                },
              ),
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            UText(
              _firstSwitcherValue ? 'Switcher Active' : 'Switcher Inactive',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            const SizedBox.square(
              dimension: 8,
            ),
            Center(
              child: USwitcher(
                disabled: false,
                switchValue: _firstSwitcherValue,
                onSwitch: (value) {
                  setState(() {
                    _firstSwitcherValue = value;
                  });
                },
              ),
            ),
            const SizedBox.square(
              dimension: 16,
            ),
            UText(
              _secondSwitcherValue ? 'Switcher Active' : 'Switcher Inactive',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            const SizedBox.square(
              dimension: 8,
            ),
            Center(
              child: USwitcher(
                switchValue: _secondSwitcherValue,
                onSwitch: (value) {
                  setState(() {
                    _secondSwitcherValue = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

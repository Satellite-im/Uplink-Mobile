import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UTextPage extends StatelessWidget {
  const UTextPage({Key? key}) : super(key: key);

  static const routeName = '/UText';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox.square(
              dimension: 16,
            ),
            _UTexts('H5 Top Menu Bar Title',
                textStyle: UTextStyle.H5_topMenuBarTitle),
            _UTexts('H1 Primary Header',
                textStyle: UTextStyle.H1_primaryHeader),
            _UTexts('H2 Secondary Header',
                textStyle: UTextStyle.H2_secondaryHeader),
            _UTexts('H3 Tertiary Header',
                textStyle: UTextStyle.H3_tertiaryHeader),
            _UTexts('H4 Fourth Header', textStyle: UTextStyle.H4_fourthHeader),
            _UTexts('B1 Body', textStyle: UTextStyle.B1_body),
            _UTexts('B2 Medium', textStyle: UTextStyle.B2_medium),
            _UTexts('B3 Italics', textStyle: UTextStyle.B3_italics),
            _UTexts('B4 Bold', textStyle: UTextStyle.B4_bold),
            _UTexts('M1 Micro', textStyle: UTextStyle.M1_micro),
            _UTexts('BUT1 Button', textStyle: UTextStyle.BUT1_button),
            _UTexts('BUT2 Secondary Button',
                textStyle: UTextStyle.BUT2_secondaryButton),
          ],
        ),
      ),
    );
  }
}

class _UTexts extends StatelessWidget {
  final String text;
  final UTextStyle textStyle;

  const _UTexts(
    this.text, {
    Key? key,
    required this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: UText(
        text,
        textStyle: textStyle,
      ),
    );
  }
}

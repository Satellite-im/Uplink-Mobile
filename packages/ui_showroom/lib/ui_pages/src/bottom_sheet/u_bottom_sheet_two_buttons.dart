import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UBottomSheetTwoButtonsPage extends StatelessWidget {
  const UBottomSheetTwoButtonsPage({Key? key}) : super(key: key);

  static const routeName = '/UBottomSheetTwoButtons';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: ListView(
          children: [
            const UText(
              'Bottom Sheet Two Buttons without icons',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            const SizedBox.square(
              dimension: 8,
            ),
            UButton.filled1(
                label: 'Click here to see the bottom sheet',
                onPressed: () {
                  UBottomSheetTwoButtons(context,
                          firstButtonOnPressed: () {},
                          secondButtonOnPressed: () {},
                          header:
                              'Bottom Sheet with two UButtons without icons',
                          firstButtonText: 'First Button',
                          secondButtonText: 'Second Button')
                      .show();
                }),
            const SizedBox.square(
              dimension: 16,
            ),
            const UText(
              'Bottom Sheet Two Buttons with icons',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            const SizedBox.square(
              dimension: 8,
            ),
            UButton.filled1(
                label: 'Click here to see the bottom sheet',
                onPressed: () {
                  UBottomSheetTwoButtons(context,
                          firstButtonIcon: UIcons.add_button,
                          secondButtonIcon: UIcons.add_contact_member,
                          firstButtonOnPressed: () {},
                          secondButtonOnPressed: () {},
                          header: 'Bottom Sheet with two UButtons with icons',
                          firstButtonText: 'First Button',
                          secondButtonText: 'Second Button')
                      .show();
                }),
            const SizedBox.square(
              dimension: 16,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UBottomSheetOptionsPage extends StatelessWidget {
  const UBottomSheetOptionsPage({Key? key}) : super(key: key);

  static const routeName = '/UBottomSheetOptions';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ListView(
            children: [
              const UText(
                'Bottom Sheet with multiple options',
                textStyle: UTextStyle.H1_primaryHeader,
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              UButton.filled1(
                  label: 'Click here to see the bottom sheet',
                  onPressed: () {
                    UBottomSheetOptions(
                      context,
                      sheetTitle: 'More Options',
                      titleList: ['Switch Account', 'New Account'],
                      iconList: [
                        UIcons.multiple_accounts,
                        UIcons.add_contact,
                      ],
                      onTapList: [
                        () {
                          // TODO(yijing): add workflow later
                        },
                        () {
                          // TODO(yijing): add workflow later
                        },
                      ],
                    ).show();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

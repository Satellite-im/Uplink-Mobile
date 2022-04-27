import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UButtonPage extends StatelessWidget {
  const UButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UButton';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const UText('UButton', textStyle: UTextStyle.H5_topMenuBarTitle),
            UButton.primary(
              label: 'UButton.primary',
              uIconData: UIcons.about,
              onPressed: () {},
            ),
            UButton.secondary(
              label: 'UButton.secondary',
              uIconData: UIcons.about,
              onPressed: () {},
            ),
            UButton.filled1(
              label: 'UButton.filled1',
              onPressed: () {},
            ),
            UButton.filled2(
              label: 'UButton.filled2',
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

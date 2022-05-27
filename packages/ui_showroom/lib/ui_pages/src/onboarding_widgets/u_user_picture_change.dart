import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UUserPictureChangePage extends StatefulWidget {
  const UUserPictureChangePage({Key? key}) : super(key: key);

  static const routeName = '/UUserPictureChange';

  @override
  State<UUserPictureChangePage> createState() => _UUserPictureChangePageState();
}

class _UUserPictureChangePageState extends State<UUserPictureChangePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UUserPictureChangePage.routeName.substring(1)),
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
              'Add or change a picture',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            const SizedBox.square(
              dimension: 8,
            ),
            Center(
              child: UUserPictureChange(
                onPictureSelected: ((pictureSelected) => {}),
              ),
            ),
            const SizedBox.square(
              dimension: 16,
            ),
          ],
        ),
      ),
    );
  }
}

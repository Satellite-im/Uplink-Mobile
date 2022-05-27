import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class ULoadingIndicatorPage extends StatefulWidget {
  const ULoadingIndicatorPage({Key? key}) : super(key: key);

  static const routeName = '/ULoadingIndicator';

  @override
  State<ULoadingIndicatorPage> createState() => _ULoadingIndicatorPageState();
}

class _ULoadingIndicatorPageState extends State<ULoadingIndicatorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.back(
        title: ULoadingIndicatorPage.routeName.substring(1),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            SizedBox.square(
              dimension: 16,
            ),
            Center(
              child: UText(
                'ULoadingIndicator',
                textStyle: UTextStyle.H1_primaryHeader,
              ),
            ),
            SizedBox.square(
              dimension: 8,
            ),
            ULoadingIndicator(),
            SizedBox.square(
              dimension: 16,
            ),
          ],
        ),
      ),
    );
  }
}

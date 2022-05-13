import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UBottomSheetPinPage extends StatelessWidget {
  const UBottomSheetPinPage({Key? key}) : super(key: key);

  static const routeName = '/UBottomSheetPin';

  @override
  Widget build(BuildContext context) {
    final ValueNotifier<int> digitSelected = ValueNotifier(4);
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
                'Bottom Sheet to select the number of digits on Pin Page',
                textStyle: UTextStyle.H1_primaryHeader,
              ),
              const SizedBox.square(
                dimension: 8,
              ),
              UButton.filled1(
                  label: 'Click here to see the bottom sheet',
                  onPressed: () {
                    UBottomSheetPin(
                      context,
                      onSelect: (p0) {
                        digitSelected.value = p0;
                      },
                    ).show();
                  }),
              const SizedBox.square(
                dimension: 32,
              ),
              ValueListenableBuilder(
                  valueListenable: digitSelected,
                  builder: (BuildContext context, int int, Widget? widget) {
                    return Center(
                      child: UText(
                        '${digitSelected.value} Digits was selected!',
                        textStyle: UTextStyle.H2_secondaryHeader,
                      ),
                    );
                  }),
              const SizedBox.square(
                dimension: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

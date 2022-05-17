import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

// GlobalKey<UDropDownMenuState> uDropDownMenuStateKey = GlobalKey();

class UDropDownMenuPage extends StatefulWidget {
  const UDropDownMenuPage({Key? key}) : super(key: key);
  static const routeName = '/UDropDownMenu';

  @override
  State<UDropDownMenuPage> createState() => _UDropDownMenuPageState();
}

class _UDropDownMenuPageState extends State<UDropDownMenuPage> {
  List<String> items = [
    'Satellite.im + Public Signaling Servers',
    'Title',
    'Title2',
    'Title3',
  ];

  String _selectedValue = 'Satellite.im + Public Signaling Servers';
  int _selectedValueIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UDropDownMenuPage.routeName.substring(1)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: UDropDownMenu(
                  items: items,
                  onSelectedItem: (item, index) {
                    _selectedValue = item;
                    _selectedValueIndex = index;
                  }),
            ),
            const SizedBox(height: 56),
            UButton.filled1(
                label: 'Continue',
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      duration: const Duration(seconds: 1),
                      content: Text(
                          'Selected value: $_selectedValue \nThe Index of selected value: $_selectedValueIndex')));
                })
          ],
        ),
      ),
    );
  }
}

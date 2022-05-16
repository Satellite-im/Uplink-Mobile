import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/u_drop_down_menu/u_drop_down_menu.dart';

GlobalKey<UDropDownMenuState> uDropDownMenuStateKey = GlobalKey();

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
                key: uDropDownMenuStateKey,
                items: items,
              ),
            ),
            const SizedBox(height: 56),
            UButton.filled1(
                label: 'Continue',
                onPressed: () {
                  final _selectedValue =
                      uDropDownMenuStateKey.currentState?.selectedValue;
                  final _selectedValueIndex =
                      uDropDownMenuStateKey.currentState?.getValueIndex();
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                          'Selected value: $_selectedValue \nThe Index of selected value: $_selectedValueIndex')));
                })
          ],
        ),
      ),
    );
  }
}

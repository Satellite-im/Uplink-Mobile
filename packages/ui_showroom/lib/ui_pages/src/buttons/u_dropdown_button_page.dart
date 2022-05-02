import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
// import 'package:ui_library/ui_library_export.dart';

class UDropDownButtonPage extends StatefulWidget {
  const UDropDownButtonPage({Key? key}) : super(key: key);
  static const routeName = '/UDropDownButton';

  @override
  State<UDropDownButtonPage> createState() => _UDropDownFABPageState();
}

class _UDropDownFABPageState extends State<UDropDownButtonPage> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UDropDownButtonPage.routeName.substring(1)),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: UColors.ctaBlue),
          padding: const EdgeInsets.fromLTRB(24, 8, 16, 8),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: dropdownValue,
              icon: const UIcon(UIcons.dropdown_menu),
              elevation: 16,
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('Current value : $dropdownValue')));
                });
              },
              items: <String>['One', 'Two', 'Three', 'Four']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: UText(
                    value,
                    textStyle: UTextStyle.BUT1_button,
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ),
    );
  }
}

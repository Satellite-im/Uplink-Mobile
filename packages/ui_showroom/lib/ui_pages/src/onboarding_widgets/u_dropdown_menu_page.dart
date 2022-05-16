import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDropDownMenuPage extends StatefulWidget {
  const UDropDownMenuPage({Key? key}) : super(key: key);
  static const routeName = '/UDropDownMenu';

  @override
  State<UDropDownMenuPage> createState() => _UDropDownMenuPageState();
}

class _UDropDownMenuPageState extends State<UDropDownMenuPage> {
  String selectedValue = 'Satellite.im + Public Signaling Servers';
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
      body: Center(
        child: DropdownButtonHideUnderline(
          child: DropdownButton2(
            isDense: true,
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Row(
                        children: [
                          UText(
                            item,
                            textStyle: UTextStyle.BUT1_primaryButton,
                          ),
                          const SizedBox(width: 8),
                        ],
                      ),
                    ))
                .toList(),
            value: selectedValue,
            selectedItemHighlightColor: UColors.ctaBlue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
            icon: const UIcon(UIcons.dropdown_menu),
            buttonHeight: 40,
            buttonPadding: const EdgeInsets.fromLTRB(25, 8, 16, 8),
            buttonDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: UColors.ctaBlue,
            ),
            itemHeight: 48,
            itemPadding: const EdgeInsets.only(left: 16),
            dropdownPadding: null,
            dropdownElevation: 0,
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: UColors.foregroundDark,
            ),
            offset: const Offset(0, -8),
          ),
        ),
      ),
    );
  }
}

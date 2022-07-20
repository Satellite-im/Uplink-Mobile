import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UDropDownMenu extends StatefulWidget {
  ///Create a UDropDownMenu
  ///
  ///[items] is a List of options(String)
  ///
  ///[selectedValue] is an optional String that shows the default selected option.
  ///If it is null, it uses the first String of the [items]
  ///
  ///[onSelectedItem] is a function to handle/get the selected value(String) and its index in the List(options)
  ///```dart
  ///UDropDownMenu(
  ///   items: [
  ///    'Satellite.im + Public Signaling Servers',
  ///    'Title',
  ///  ],
  /// onSelectedItem: (item, index) {
  ///         _selectedValue = item;
  ///         _selectedValueIndex = index;
  ///  }),
  ///),
  ///...
  ///   UButton.filled1(
  ///     label: 'Continue',
  ///     onPressed: () {
  ///        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  ///                content: Text(
  ///                    'Selected value: $_selectedValue \nThe Index of selected value: $_selectedValueIndex')));
  ///          }),
  ///```
  const UDropDownMenu({
    Key? key,
    required this.items,
    this.selectedValue,
    required this.onSelectedItem,
  }) : super(key: key);
  final List<String> items;
  final String? selectedValue;
  final Function(String item, int index) onSelectedItem;

  @override
  State<UDropDownMenu> createState() => UDropDownMenuState();
}

class UDropDownMenuState extends State<UDropDownMenu> {
  late String? selectedValue = widget.selectedValue;

  int getValueIndex() {
    return widget.items.indexOf(selectedValue ?? widget.items.first);
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        isDense: true,
        items: widget.items
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
        value: selectedValue ??= widget.items.first,
        selectedItemHighlightColor: UColors.ctaBlue,
        onChanged: (value) {
          setState(() {
            selectedValue = value as String;
          });
          widget.onSelectedItem.call(selectedValue!, getValueIndex());
        },
        icon: const UIcon(UIcons.dropdown_menu),
        buttonHeight: USizes.dropDownMenuButtonHeight,
        buttonPadding: const EdgeInsets.fromLTRB(24, 11, 21, 11),
        buttonDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: UColors.ctaBlue,
        ),
        itemHeight: USizes.dropDownMenuItemHeight,
        itemPadding: const EdgeInsets.only(left: 16),
        dropdownPadding: null,
        dropdownElevation: 0,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: UColors.foregroundDark,
        ),
        offset: const Offset(0, -8),
      ),
    );
  }
}

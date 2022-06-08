import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class UBottomSheetOptions {
  /// Creates a bottom sheet to use in Pin Pages
  ///
  /// It allows to select between 4, 6 or 8 digits as pin length.
  ///
  /// [onSelect] method will return the number of selected integer type digits
  ///
  /// To use, is necessary to call the class and the method [show]
  ///
  /// You need to call an action to show the [UBottomSheetOptions],
  /// example:
  /// ```dart
  /// UButton.filled1(
  ///     label: 'Click here to see the bottom sheet',
  ///       onPressed: () {
  ///         UBottomSheetOptions(
  ///             context,
  ///             onSelect: (p0) {},
  ///         ).show();
  /// }),
  /// ```
  UBottomSheetOptions(
    this.context, {
    required this.sheetTitle,
    required this.titleList,
    required this.iconList,
    required this.onTapList,
  });

  final BuildContext context;
  final String sheetTitle;
  final List<String> titleList;
  final List<UIconData> iconList;
  final List<void Function()> onTapList;

  Future show() {
    return UBottomSheet(
      context,
      child: _UBottomSheetOptionsBody(
        sheetTitle: sheetTitle,
        titleList: titleList,
        iconList: iconList,
        onTapList: onTapList,
      ),
    ).show();
  }
}

class _UBottomSheetOptionsBody extends StatelessWidget {
  const _UBottomSheetOptionsBody({
    Key? key,
    required this.sheetTitle,
    required this.titleList,
    required this.iconList,
    required this.onTapList,
  }) : super(key: key);

  final String sheetTitle;
  final List<String> titleList;
  final List<UIconData> iconList;
  final List<void Function()> onTapList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 55, 16, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UText(
            sheetTitle,
            textStyle: UTextStyle.H3_tertiaryHeader,
          ),
          const SizedBox(
            height: 9.4,
          ),
          ...List.generate(
            titleList.length,
            (index) => ListTile(
              contentPadding: EdgeInsets.zero,
              horizontalTitleGap: 8,
              minLeadingWidth: 24,
              leading: UIcon(iconList[index]),
              title: UText(
                titleList[index],
                textStyle: UTextStyle.H5_fifthHeader,
                textColor: UColors.white,
              ),
              onTap: onTapList[index],
            ),
          ),
        ],
      ),
    );
  }
}

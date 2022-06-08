import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';

class UBottomSheetOptions {
  /// BottomSheet with multiple options
  ///
  /// [sheetTitle]-> The title of the bottom sheet
  ///
  /// [titleList]-> title(String) for every option
  ///
  /// [iconList]-> icon(UIcons.**) for every option
  ///
  /// [onTapList]-> Function for every option when it is tapped
  ///
  /// To use, is necessary to call the class and the method [show]
  ///
  /// You need to call an action to show the [UBottomSheetOptions],
  /// example:
  /// ```dart
  ///UBottomSheetOptions(
  ///                context,
  ///                sheetTitle: 'More Options',
  ///                titleList: ['Switch Account', 'New Account'],
  ///                iconList: [UIcons.multiple_accounts,
  ///                           UIcons.add_contact_member],
  ///                onTapList: [
  ///                  () {
  ///                    //do something for 'Switch Account'
  ///                  },
  ///                  () {
  ///                    //do something for 'New Account'
  ///                  },
  ///                ],
  ///              ).show();
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

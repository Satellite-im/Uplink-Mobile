import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UPopMenuItemPage extends StatefulWidget {
  const UPopMenuItemPage({Key? key}) : super(key: key);

  static const routeName = '/UPopMenuItem';

  @override
  State<UPopMenuItemPage> createState() => _UPopMenuItemPageState();
}

class _UPopMenuItemPageState extends State<UPopMenuItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(UPopMenuItemPage.routeName.substring(1)),
        actions: [
          UPopupMenuButton<String>(
            color: UColors.foregroundDark,
            offset: const Offset(-16, 60),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            icon: const UIcon(UIcons.hamburger_menu),
            onSelected: (String result) {
              switch (result) {
                case 'Remove Avatar':
                  UBottomSheetTwoButtons(
                    context,
                    header: 'Do you want to remove avatar?',
                    firstButtonText: 'Cancel',
                    secondButtonText: 'Remove',
                    firstButtonColor: UColors.ctaDark,
                    secondButtonColor: UColors.termRed,
                    firstButtonOnPressed: () => Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pop(),
                    secondButtonOnPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ).show();
                  break;
                case 'Remove Banner':
                  UBottomSheetTwoButtons(
                    context,
                    header: 'Do you want to remove banner?',
                    firstButtonText: 'Cancel',
                    secondButtonText: 'Remove',
                    firstButtonColor: UColors.ctaDark,
                    secondButtonColor: UColors.termRed,
                    firstButtonOnPressed: () => Navigator.of(
                      context,
                      rootNavigator: true,
                    ).pop(),
                    secondButtonOnPressed: () {
                      Navigator.of(context, rootNavigator: true).pop();
                    },
                  ).show();
                  break;
                default:
              }
            },
            itemBuilder: (BuildContext context) {
              return <UPopupMenuEntry<String>>[
                const UPopupMenuItem<String>(
                  padding: EdgeInsets.zero,
                  value: 'Remove Avatar',
                  child: SizedBox(
                    width: 160,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: UText(
                        'Remove Avatar',
                        textStyle: UTextStyle.BUT1_primaryButton,
                        textColor: UColors.termRed,
                      ),
                    ),
                  ),
                ),
                const UPopupMenuItem<String>(
                  value: 'Remove Banner',
                  padding: EdgeInsets.zero,
                  child: SizedBox(
                    width: 160,
                    child: Padding(
                      padding: EdgeInsets.only(left: 16),
                      child: UText(
                        'Remove Banner',
                        textStyle: UTextStyle.BUT1_primaryButton,
                        textColor: UColors.termRed,
                      ),
                    ),
                  ),
                ),
              ];
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.end,
          children: const [
            SizedBox.square(
              dimension: 16,
            ),
            UText(
              'Click in the hamburguer menu in app bar',
              textStyle: UTextStyle.H1_primaryHeader,
            ),
            SizedBox.square(
              dimension: 8,
            ),
          ],
        ),
      ),
    );
  }
}

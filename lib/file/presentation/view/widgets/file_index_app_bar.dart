import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/ui_utils/bottom_navigation_bar.dart';

class FileIndexAppbar extends StatelessWidget {
  const FileIndexAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return UAppBar.actions(
      actionList: [
        IconButton(
          icon: const UIcon(
            UIcons.search,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
        IconButton(
          icon: const UIcon(
            UIcons.add_folder,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
        IconButton(
          icon: const UIcon(
            UIcons.hamburger_menu,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
      ],
      leading: IconButton(
        icon: const UIcon(
          UIcons.lefthand_navigation_drawer,
          color: UColors.textMed,
        ),
        onPressed: () async {
          bottomBarScaffoldStateKey.currentState?.openDrawer();
        },
      ),
      title: UAppStrings.fileIndexPage_appBarTitle,
    );
  }
}

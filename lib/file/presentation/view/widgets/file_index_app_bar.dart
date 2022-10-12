import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/presentation/view/helper/helper_export.dart';
import 'package:uplink/file/presentation/view/view_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/ui_utils/ui_utils_export.dart';

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
          onPressed: () {
            showCustomSearch(
              context: context,
              delegate: ItemSearch(loadingItems()),
            );
          },
        ),
        IconButton(
          icon: const UIcon(
            UIcons.add_folder,
            color: UColors.textMed,
          ),
          onPressed: () => uploadPhoto(context),
        ),
        IconButton(
          icon: const UIcon(
            UIcons.hamburger_menu,
            color: UColors.textMed,
          ),
          onPressed: () {
            UBottomSheetOptions(
              context,
              sheetTitle: UAppStrings.moreOptions,
              titleList: [
                UAppStrings.favorites,
                UAppStrings.remove,
              ],
              iconList: [UIcons.favorite, UIcons.remove],
              onTapList: [
                () {
                  Navigator.of(context)
                      .popAndPushNamed(FavoritesListPage.routeName);
                },
                () {
                  Navigator.of(context)
                      .popAndPushNamed(RemoveListPage.routeName);
                },
              ],
            ).show();
          },
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

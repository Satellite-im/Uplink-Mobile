import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class FavoritesListPage extends StatefulWidget {
  const FavoritesListPage({super.key});

  @override
  State<FavoritesListPage> createState() => _FavoritesListPageState();
}

class _FavoritesListPageState extends State<FavoritesListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar.actions(
        title: 'Favorites',
        actionList: [
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
                  'Remove',
                ],
                iconList: [UIcons.remove],
                onTapList: [
                  () {
                    // TODO(yijing): add workflow later
                  },
                ],
              ).show();
            },
          ),
        ],
      ),
      body: const FileIndexBody.favoritesList(),
    );
  }
}
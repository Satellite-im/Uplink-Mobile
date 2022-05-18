import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _AppBarType { back, iconOnly, actions }

class UAppBar extends StatelessWidget with PreferredSizeWidget {
  final _AppBarType _appBarType;
  final String? _title;
  final List<Widget>? _actionsList;

  UAppBar.back({
    Key? key,
    required String title,
  })  : _appBarType = _AppBarType.back,
        _title = title,
        _actionsList = [],
        super(key: key);

  UAppBar.iconOnly({
    Key? key,
    required List<Widget> actionList,
  })  : _appBarType = _AppBarType.iconOnly,
        _title = null,
        _actionsList = actionList,
        super(key: key);

  UAppBar.acitons({
    Key? key,
    required String title,
    required List<Widget> actionList,
  })  : _appBarType = _AppBarType.actions,
        _title = title,
        _actionsList = actionList,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: (_appBarType == _AppBarType.back) ||
              (_appBarType == _AppBarType.actions)
          ? Text(_title!)
          : null,
      centerTitle: false,
      leading: IconButton(
        icon: const UIcon(
          UIcons.back_arrow_button,
          color: UColors.textMed,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      actions: (_appBarType == _AppBarType.iconOnly) ||
              (_appBarType == _AppBarType.actions)
          ? _actionsList!
          : null,
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

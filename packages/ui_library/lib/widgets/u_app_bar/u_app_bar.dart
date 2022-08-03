import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

enum _AppBarType { back, iconOnly, actions }

class UAppBar extends StatelessWidget with PreferredSizeWidget {
  final _AppBarType _appBarType;
  final String? _title;
  final List<Widget>? _actionsList;
  final Function? _onBackPressed;
  final Widget? _leading;
  final Widget? _flexibleSpace;
  final Color? _backIconColor;
  final bool cancelCloseFunctionInBackButton;

  ///AppBar with a title and back icon
  ///```dart
  ///UAppBar.back(title: 'Create account')
  ///```
  UAppBar.back({
    Key? key,
    required String title,
    Function? onBackPressed,
    Widget? flexibleSpace,
    Color? backIconColor,
    this.cancelCloseFunctionInBackButton = false,
  })  : _appBarType = _AppBarType.back,
        _title = title,
        _onBackPressed = onBackPressed,
        _flexibleSpace = flexibleSpace,
        _actionsList = [],
        _leading = null,
        _backIconColor = backIconColor,
        super(key: key);

  ///AppBar has a list of actions without title
  ///```dart
  ///UAppBar.iconOnly(
  ///      actionList: [
  ///         IconButton(
  ///           icon: const UIcon(UIcons.menu_bar_contacts),
  ///           onPressed: () {},
  ///),],),
  ///```
  UAppBar.iconOnly({
    Key? key,
    required List<Widget> actionList,
    Widget? leading,
    Widget? flexibleSpace,
    Color? backIconColor,
  })  : _appBarType = _AppBarType.iconOnly,
        _title = null,
        cancelCloseFunctionInBackButton = false,
        _onBackPressed = null,
        _actionsList = actionList,
        _flexibleSpace = flexibleSpace,
        _leading = leading,
        _backIconColor = backIconColor,
        super(key: key);

  ///AppBar has a list of actions and a title
  ///```dart
  ///UAppBar.actions(title: 'Username', actionList: [
  ///    IconButton(
  ///      icon: const UIcon(UIcons.call),
  ///      onPressed: () {},
  ///     ),
  ///    IconButton(
  ///      icon: const UIcon(UIcons.video_call_button),
  ///      onPressed: () {},
  ///     ),
  ///    IconButton(
  ///       icon: const UIcon(UIcons.pinned_message_button),
  ///       onPressed: () {},
  ///     ),
  ///    ])),
  ///```
  UAppBar.actions({
    Key? key,
    required String title,
    required List<Widget> actionList,
    Widget? leading,
    Widget? flexibleSpace,
    Color? backIconColor,
  })  : _appBarType = _AppBarType.actions,
        _title = title,
        _onBackPressed = null,
        cancelCloseFunctionInBackButton = false,
        _actionsList = actionList,
        _flexibleSpace = flexibleSpace,
        _leading = leading,
        _backIconColor = backIconColor,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      title: (_appBarType == _AppBarType.back) ||
              (_appBarType == _AppBarType.actions)
          ? Text(
              _title!,
            )
          : null,
      centerTitle: false,
      titleSpacing: 0,
      leading: (_leading == null)
          ? IconButton(
              icon: UIcon(
                UIcons.back_arrow,
                color: _backIconColor ?? UColors.textMed,
              ),
              onPressed: () async {
                _onBackPressed?.call();
                if (!cancelCloseFunctionInBackButton) {
                  Navigator.pop(context);
                }
              },
            )
          : _leading,
      actions: (_appBarType == _AppBarType.iconOnly) ||
              (_appBarType == _AppBarType.actions)
          ? _actionsList!
          : null,
      elevation: 0,
      flexibleSpace: _flexibleSpace,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

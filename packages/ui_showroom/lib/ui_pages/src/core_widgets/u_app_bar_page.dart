import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UAppBarPage extends StatelessWidget {
  const UAppBarPage({Key? key}) : super(key: key);
  static const routeName = '/UAppBar';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TitleColumn(
            title: 'UAppBar.back',
            widget: UAppBar.back(title: 'Create account'),
          ),
          TitleColumn(
            title: 'UAppBar.iconOnly',
            widget: UAppBar.iconOnly(
              actionList: [
                IconButton(
                  icon: const UIcon(UIcons.menu_bar_contacts),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          TitleColumn(
              title: 'UAppBar.actions',
              widget: UAppBar.actions(title: 'Username', actionList: [
                IconButton(
                  icon: const UIcon(UIcons.voice_call),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const UIcon(UIcons.video_call),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const UIcon(UIcons.pinned_message),
                  onPressed: () {},
                ),
              ])),
        ],
      )),
    );
  }
}

class TitleColumn extends StatelessWidget {
  const TitleColumn({
    Key? key,
    required this.title,
    required this.widget,
  }) : super(key: key);
  final String title;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(title),
        ),
        widget,
      ],
    );
  }
}

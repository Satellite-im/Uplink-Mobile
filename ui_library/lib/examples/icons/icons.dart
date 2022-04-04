import 'package:flutter/material.dart';
import 'package:ui_library/core/icons/icons.dart';

import '../../widgets/icon/icon.dart';

class UIconExample extends StatelessWidget {
  const UIconExample({Key? key}) : super(key: key);

  static const routeName = 'ui_icon_example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UIcon Examples')),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox.square(
              dimension: 16,
            ),
            const _UIconsRow(
              uIconList: [
                UIcon(UIcons.about_icon),
                UIcon(UIcons.add_button),
                UIcon(UIcons.add_contact_member_icon),
                UIcon(UIcons.add_folder_icon),
                UIcon(UIcons.add_note_icon),
                UIcon(UIcons.back_arrow_button),
                UIcon(UIcons.call_icon),
                UIcon(UIcons.camera_icon),
                UIcon(UIcons.chatbar_gifs),
                UIcon(UIcons.chatbar_emojis),
                UIcon(UIcons.chatbar_send_button),
                UIcon(UIcons.chatbar_stickers),
              ],
            ),
            const _UIconsRow(
              uIconList: [
                UIcon(UIcons.chatbar_gifs),
                UIcon(UIcons.chatbar_emojis),
                UIcon(UIcons.chatbar_send_button),
                UIcon(UIcons.chatbar_stickers),
                UIcon(UIcons.checkmark_icon),
                UIcon(UIcons.close_button),
                UIcon(UIcons.compose_message_button),
                UIcon(UIcons.copy_clone_button),
                UIcon(UIcons.end_call_icon),
                UIcon(UIcons.end_video_call_icon),
                UIcon(UIcons.favorite_button),
                UIcon(UIcons.file_icon),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              child: const UIcon(UIcons.tap_select_box),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  UIcon(UIcons.vector_stroke),
                  SizedBox.square(
                    dimension: 8,
                  ),
                  Text('Vector Stroke Icon')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UIconsRow extends StatelessWidget {
  final List<UIcon> uIconList;

  const _UIconsRow({
    Key? key,
    required this.uIconList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: uIconList,
      ),
    );
  }
}

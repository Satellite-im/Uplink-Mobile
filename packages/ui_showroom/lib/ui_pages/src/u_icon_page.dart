import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UIconPage extends StatelessWidget {
  const UIconPage({Key? key}) : super(key: key);

  static const routeName = 'ui_example';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('UIcon Examples')),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 16.0, 0, 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                    UText(
                      '${_allIcons.length} icons',
                      textStyle: UTextStyle.H5_topMenuBarTitle,
                    )
                  ] +
                  _allIcons,
            ),
          ),
        ),
      ),
    );
  }
}

class UIconText extends StatelessWidget {
  const UIconText(
    this.icon,
    this.iconName, {
    Key? key,
  }) : super(key: key);

  final UIconData icon;
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          UIcon(icon),
          const SizedBox.square(
            dimension: 8,
          ),
          UText(
            iconName,
            textStyle: UTextStyle.H4_fourthHeader,
          ),
        ],
      ),
    );
  }
}

const _allIcons = <Widget>[
  UIconText(UIcons.about, 'about'),
  UIconText(UIcons.add_button, 'add_button'),
  UIconText(UIcons.add_contact_member, 'add_contact_member'),
  UIconText(UIcons.add_folder, 'add_folder'),
  UIconText(UIcons.add_note, 'add_note'),
  UIconText(UIcons.back_arrow_button, 'back_arrow_button'),
  UIconText(UIcons.call, 'call'),
  UIconText(UIcons.camera, 'camera'),
  UIconText(UIcons.chatbar_gifs, 'chatbar_gifs'),
  UIconText(UIcons.chatbar_emojis, 'chatbar_emojis'),
  UIconText(UIcons.chatbar_send_button, 'chatbar_send_button'),
  UIconText(UIcons.chatbar_stickers, 'chatbar_stickers'),
  UIconText(UIcons.checkmark, 'checkmark'),
  UIconText(UIcons.close_button, 'close_button'),
  UIconText(UIcons.compose_message_button, 'compose_message_button'),
  UIconText(UIcons.copy_clone_button, 'copy_clone_button'),
  UIconText(UIcons.end_call, 'end_call'),
  UIconText(UIcons.end_video_call, 'end_video_call'),
  UIconText(UIcons.favorite_button, 'favorite_button'),
  UIconText(UIcons.file, 'file'),
  UIconText(UIcons.forward_arrow_button, 'forward_arrow_button'),
  UIconText(UIcons.friend_added, 'friend_added'),
  UIconText(UIcons.grid_view, 'grid_view'),
  UIconText(UIcons.hamburger_menu, 'hamburger_menu'),
  UIconText(UIcons.lefthand_navigation_drawer, 'lefthand_navigation_drawer'),
  UIconText(UIcons.link_button, 'link_button'),
  UIconText(UIcons.list_view, 'list_view'),
  UIconText(UIcons.location, 'location'),
  UIconText(UIcons.menu_bar_contacts, 'menu_bar_contacts'),
  UIconText(UIcons.menu_bar_files, 'menu_bar_files'),
  UIconText(UIcons.menu_bar_home, 'menu_bar_home'),
  UIconText(UIcons.menu_bar_notifications, 'menu_bar_notifications'),
  UIconText(UIcons.message, 'message'),
  UIconText(UIcons.multiple_accounts, 'multiple_accounts'),
  UIconText(UIcons.mute, 'mute'),
  UIconText(UIcons.pin_entry_backspace_button, 'pin_entry_backspace_button'),
  UIconText(UIcons.qr_code, 'qr_code'),
  UIconText(UIcons.remove_friend, 'remove_friend'),
  UIconText(UIcons.remove, 'remove'),
  UIconText(UIcons.right_arrow_inline_button, 'right_arrow_inline_button'),
  UIconText(UIcons.save_button, 'save_button'),
  UIconText(UIcons.search, 'search'),
  UIconText(UIcons.setting, 'setting'),
  UIconText(UIcons.settings_logout, 'settings_logout'),
  UIconText(UIcons.swap_camera, 'swap_camera'),
  UIconText(UIcons.tap_select_box, 'tap_select_box'),
  UIconText(UIcons.unmute, 'unmute'),
  UIconText(UIcons.vector_stroke, 'vector_stroke'),
  UIconText(UIcons.video_call_button, 'video_call_button'),
  UIconText(UIcons.developer, 'developer'),
  UIconText(UIcons.dropdown_menu, 'dropdown_menu'),
  UIconText(UIcons.general, 'general'),
  UIconText(UIcons.import, 'import'),
  UIconText(UIcons.security, 'security'),
  UIconText(UIcons.try_again, 'try_again'),
  UIconText(UIcons.checkmark_rounded, 'checkmark_rounded'),
];

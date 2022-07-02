import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';

class UIconPage extends StatelessWidget {
  const UIconPage({Key? key}) : super(key: key);

  static const routeName = '/UIcon';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(routeName.substring(1)),
      ),
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
                      textStyle: UTextStyle.H1_primaryHeader,
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

class UIconTextWithPadding extends StatelessWidget {
  const UIconTextWithPadding(
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
      child: UIconText(
        icon: icon,
        text: iconName,
      ),
    );
  }
}

const _allIcons = <Widget>[
  UIconTextWithPadding(UIcons.about, 'about'),
  UIconTextWithPadding(UIcons.account_id, 'account_id'),
  UIconTextWithPadding(UIcons.add_button, 'add_button'),
  UIconTextWithPadding(UIcons.add_contact_member, 'add_contact_member'),
  UIconTextWithPadding(UIcons.add_folder, 'add_folder'),
  UIconTextWithPadding(UIcons.add_note, 'add_note'),
  UIconTextWithPadding(UIcons.apple_watch, 'apple_watch'),
  UIconTextWithPadding(UIcons.audio_off, 'audio_off'),
  UIconTextWithPadding(UIcons.audio_on, 'audio_on'),
  UIconTextWithPadding(UIcons.back_arrow_button, 'back_arrow_button'),
  UIconTextWithPadding(UIcons.blocked_contacts, 'blocked_contacts'),
  UIconTextWithPadding(UIcons.call, 'call'),
  UIconTextWithPadding(UIcons.camera, 'camera'),
  UIconTextWithPadding(UIcons.chatbar_emojis, 'chatbar_emojis'),
  UIconTextWithPadding(UIcons.chatbar_gifs, 'chatbar_gifs'),
  UIconTextWithPadding(UIcons.chatbar_send_button, 'chatbar_send_button'),
  UIconTextWithPadding(UIcons.chatbar_stickers, 'chatbar_stickers'),
  UIconTextWithPadding(UIcons.checkmark, 'checkmark'),
  UIconTextWithPadding(UIcons.checkmark_rounded, 'checkmark_rounded'),
  UIconTextWithPadding(UIcons.close_button, 'close_button'),
  UIconTextWithPadding(UIcons.compose_message_button, 'compose_message_button'),
  UIconTextWithPadding(UIcons.copy_clone_button, 'copy_clone_button'),
  UIconTextWithPadding(UIcons.desktop, 'desktop'),
  UIconTextWithPadding(UIcons.developer, 'developer'),
  UIconTextWithPadding(UIcons.devices, 'devices'),
  UIconTextWithPadding(UIcons.dropdown_menu, 'dropdown_menu'),
  UIconTextWithPadding(UIcons.encrypted, 'encrypted'),
  UIconTextWithPadding(UIcons.end_call, 'end_call'),
  UIconTextWithPadding(UIcons.end_video_call, 'end_video_call'),
  UIconTextWithPadding(UIcons.favorite_button, 'favorite_button'),
  UIconTextWithPadding(UIcons.file, 'file'),
  UIconTextWithPadding(UIcons.forward_arrow_button, 'forward_arrow_button'),
  UIconTextWithPadding(UIcons.friend_added, 'friend_added'),
  UIconTextWithPadding(UIcons.friend_requests, 'friend_requests'),
  UIconTextWithPadding(UIcons.general, 'general'),
  UIconTextWithPadding(UIcons.go_back, 'go_back'),
  UIconTextWithPadding(UIcons.grid_view, 'grid_view'),
  UIconTextWithPadding(UIcons.hamburger_menu, 'hamburger_menu'),
  UIconTextWithPadding(UIcons.hide, 'hide'),
  UIconTextWithPadding(UIcons.image, 'image'),
  UIconTextWithPadding(UIcons.import, 'import'),
  UIconTextWithPadding(UIcons.laptop, 'laptop'),
  UIconTextWithPadding(
      UIcons.lefthand_navigation_drawer, 'lefthand_navigation_drawer'),
  UIconTextWithPadding(UIcons.link_button, 'link_button'),
  UIconTextWithPadding(UIcons.list_view, 'list_view'),
  UIconTextWithPadding(UIcons.location, 'location'),
  UIconTextWithPadding(UIcons.menu_bar_contacts, 'menu_bar_contacts'),
  UIconTextWithPadding(UIcons.menu_bar_files, 'menu_bar_files'),
  UIconTextWithPadding(UIcons.menu_bar_home, 'menu_bar_home'),
  UIconTextWithPadding(UIcons.menu_bar_notifications, 'menu_bar_notifications'),
  UIconTextWithPadding(UIcons.message, 'message'),
  UIconTextWithPadding(UIcons.mobile_phone, 'mobile_phone'),
  UIconTextWithPadding(UIcons.multiple_accounts, 'multiple_accounts'),
  UIconTextWithPadding(UIcons.mute, 'mute'),
  UIconTextWithPadding(UIcons.outgoing_requests, 'outgoing_requests'),
  UIconTextWithPadding(
      UIcons.pin_entry_backspace_button, 'pin_entry_backspace_button'),
  UIconTextWithPadding(UIcons.pinned_message_button, 'pinned_message_button'),
  UIconTextWithPadding(UIcons.qr_code, 'qr_code'),
  UIconTextWithPadding(UIcons.qr_code_scanner_border, 'qr_code_scanner_border'),
  UIconTextWithPadding(UIcons.refresh_try_again, 'refresh_try_again'),
  UIconTextWithPadding(UIcons.remove, 'remove'),
  UIconTextWithPadding(UIcons.remove_friend, 'remove_friend'),
  UIconTextWithPadding(UIcons.report, 'report'),
  UIconTextWithPadding(UIcons.reveal, 'reveal'),
  UIconTextWithPadding(
      UIcons.right_arrow_inline_button, 'right_arrow_inline_button'),
  UIconTextWithPadding(UIcons.save_button, 'save_button'),
  UIconTextWithPadding(UIcons.search, 'search'),
  UIconTextWithPadding(UIcons.security, 'security'),
  UIconTextWithPadding(UIcons.setting, 'setting'),
  UIconTextWithPadding(UIcons.settings_logout, 'settings_logout'),
  UIconTextWithPadding(UIcons.swap_camera, 'swap_camera'),
  UIconTextWithPadding(UIcons.tablet, 'tablet'),
  UIconTextWithPadding(UIcons.tap_select_box, 'tap_select_box'),
  UIconTextWithPadding(UIcons.unblock, 'unblock'),
  UIconTextWithPadding(UIcons.unencrypted, 'unencrypted'),
  UIconTextWithPadding(UIcons.unmute, 'unmute'),
  UIconTextWithPadding(UIcons.user_profile, 'user_profile'),
  UIconTextWithPadding(UIcons.video_call_button, 'video_call_button'),
  UIconTextWithPadding(UIcons.video_play, 'video_play'),
];

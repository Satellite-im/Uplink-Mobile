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
  UIconTextWithPadding(UIcons.add, 'add'),
  UIconTextWithPadding(UIcons.add_contact, 'add_contact'),
  UIconTextWithPadding(UIcons.add_folder, 'add_folder'),
  UIconTextWithPadding(UIcons.add_note, 'add_note'),
  UIconTextWithPadding(UIcons.apple_watch, 'apple_watch'),
  UIconTextWithPadding(UIcons.audio_off, 'audio_off'),
  UIconTextWithPadding(UIcons.audio_on, 'audio_on'),
  UIconTextWithPadding(UIcons.back_arrow, 'back_arrow'),
  UIconTextWithPadding(UIcons.blocked_contacts, 'blocked_contacts'),
  UIconTextWithPadding(UIcons.camera, 'camera'),
  UIconTextWithPadding(UIcons.chatbar_emojis, 'chatbar_emojis'),
  UIconTextWithPadding(UIcons.chatbar_gifs, 'chatbar_gifs'),
  UIconTextWithPadding(UIcons.chatbar_send, 'chatbar_send'),
  UIconTextWithPadding(UIcons.chatbar_stickers, 'chatbar_stickers'),
  UIconTextWithPadding(UIcons.checkmark_1, 'checkmark_1'),
  UIconTextWithPadding(UIcons.checkmark_2, 'checkmark_2'),
  UIconTextWithPadding(UIcons.close, 'close'),
  UIconTextWithPadding(UIcons.compose_message, 'compose_message'),
  UIconTextWithPadding(UIcons.copy_or_clone_button, 'copy_or_clone_button'),
  UIconTextWithPadding(UIcons.desktop, 'desktop'),
  UIconTextWithPadding(UIcons.developer, 'developer'),
  UIconTextWithPadding(UIcons.devices, 'devices'),
  UIconTextWithPadding(UIcons.document, 'document'),
  UIconTextWithPadding(UIcons.download, 'download'),
  UIconTextWithPadding(UIcons.dropdown_menu, 'dropdown_menu'),
  UIconTextWithPadding(UIcons.encrypted, 'encrypted'),
  UIconTextWithPadding(UIcons.end_call, 'end_call'),
  UIconTextWithPadding(UIcons.end_video_call, 'end_video_call'),
  UIconTextWithPadding(UIcons.favorite, 'favorite'),
  UIconTextWithPadding(UIcons.forward_arrow, 'forward_arrow'),
  UIconTextWithPadding(UIcons.friend_added, 'friend_added'),
  UIconTextWithPadding(UIcons.friend_requests, 'friend_requests'),
  UIconTextWithPadding(UIcons.general, 'general'),
  UIconTextWithPadding(UIcons.go_back, 'go_back'),
  UIconTextWithPadding(UIcons.grid_view, 'grid_view'),
  UIconTextWithPadding(UIcons.hamburger_menu, 'hamburger_menu'),
  UIconTextWithPadding(UIcons.hide, 'hide'),
  UIconTextWithPadding(UIcons.image, 'image'),
  UIconTextWithPadding(UIcons.import, 'import'),
  UIconTextWithPadding(UIcons.info, 'info'),
  UIconTextWithPadding(UIcons.laptop, 'laptop'),
  UIconTextWithPadding(
      UIcons.lefthand_navigation_drawer, 'lefthand_navigation_drawer'),
  UIconTextWithPadding(UIcons.link, 'link'),
  UIconTextWithPadding(UIcons.list_view, 'list_view'),
  UIconTextWithPadding(UIcons.loading, 'loading'),
  UIconTextWithPadding(UIcons.location, 'location'),
  UIconTextWithPadding(UIcons.logout, 'logout'),
  UIconTextWithPadding(UIcons.menu_bar_contacts, 'menu_bar_contacts'),
  UIconTextWithPadding(UIcons.menu_bar_files, 'menu_bar_files'),
  UIconTextWithPadding(UIcons.menu_bar_home, 'menu_bar_home'),
  UIconTextWithPadding(UIcons.message, 'message'),
  UIconTextWithPadding(UIcons.mobile_phone, 'mobile_phone'),
  UIconTextWithPadding(UIcons.multiple_accounts, 'multiple_accounts'),
  UIconTextWithPadding(UIcons.mute, 'mute'),
  UIconTextWithPadding(UIcons.mute_notifications, 'mute_notifications'),
  UIconTextWithPadding(UIcons.notifications, 'notifications'),
  UIconTextWithPadding(UIcons.outgoing_requests, 'outgoing_requests'),
  UIconTextWithPadding(UIcons.pin_entry_backspace, 'pin_entry_backspace'),
  UIconTextWithPadding(UIcons.pinned_message, 'pinned_message'),
  UIconTextWithPadding(UIcons.qr_code, 'qr_code'),
  UIconTextWithPadding(UIcons.qr_code_scanner_border, 'qr_code_scanner_border'),
  UIconTextWithPadding(UIcons.refresh, 'refresh'),
  UIconTextWithPadding(UIcons.remove, 'remove'),
  UIconTextWithPadding(UIcons.remove_friend, 'remove_friend'),
  UIconTextWithPadding(UIcons.report, 'report'),
  UIconTextWithPadding(UIcons.reveal, 'reveal'),
  UIconTextWithPadding(UIcons.right_arrow_inline_row, 'right_arrow_inline_row'),
  UIconTextWithPadding(UIcons.search, 'search'),
  UIconTextWithPadding(UIcons.security, 'security'),
  UIconTextWithPadding(UIcons.select_box, 'select_box'),
  UIconTextWithPadding(UIcons.setting, 'setting'),
  UIconTextWithPadding(UIcons.swap_camera, 'swap_camera'),
  UIconTextWithPadding(UIcons.tablet, 'tablet'),
  UIconTextWithPadding(UIcons.unblock, 'unblock'),
  UIconTextWithPadding(UIcons.unencrypted, 'unencrypted'),
  UIconTextWithPadding(UIcons.unmute, 'unmute'),
  UIconTextWithPadding(UIcons.user_profile, 'user_profile'),
  UIconTextWithPadding(UIcons.video_call, 'video_call'),
  UIconTextWithPadding(UIcons.video_play, 'video_play'),
  UIconTextWithPadding(UIcons.voice_call, 'voice_call'),
];

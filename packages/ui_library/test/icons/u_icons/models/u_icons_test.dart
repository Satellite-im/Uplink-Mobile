import 'package:flutter_test/flutter_test.dart';
import 'package:ui_library/icons/u_icons/models/models_export.dart';

void main() {
  const _kFontFam = 'UIcons';
  const String? _kFontPkg = null;
  test('Test all UIcons', () {
    const aboutIcon = UIcons.about_icon;
    expect(
      aboutIcon,
      const UIconData(0xe800, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const addButton = UIcons.add_button;
    expect(
      addButton,
      const UIconData(0xe801, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const addContactMemberIcon = UIcons.add_contact_member_icon;
    expect(
      addContactMemberIcon,
      const UIconData(0xe802, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const addFolderIcon = UIcons.add_folder_icon;
    expect(
      addFolderIcon,
      const UIconData(0xe803, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const addNoteIcon = UIcons.add_note_icon;
    expect(
      addNoteIcon,
      const UIconData(0xe804, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const backArrowButton = UIcons.back_arrow_button;
    expect(
      backArrowButton,
      const UIconData(0xe805, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const callIcon = UIcons.call_icon;
    expect(
      callIcon,
      const UIconData(0xe806, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const cameraIcon = UIcons.camera_icon;
    expect(
      cameraIcon,
      const UIconData(0xe807, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const chatbarEmojis = UIcons.chatbar_emojis;
    expect(
      chatbarEmojis,
      const UIconData(0xe809, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const chatbarGifs = UIcons.chatbar_gifs;
    expect(
      chatbarGifs,
      const UIconData(0xe808, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const chatbarSendButton = UIcons.chatbar_send_button;
    expect(
      chatbarSendButton,
      const UIconData(0xe80a, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const chatbarStickers = UIcons.chatbar_stickers;
    expect(
      chatbarStickers,
      const UIconData(0xe80b, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const checkmarkIcon = UIcons.checkmark_icon;
    expect(
      checkmarkIcon,
      const UIconData(0xe80c, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const closeButton = UIcons.close_button;
    expect(
      closeButton,
      const UIconData(0xe80d, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const composeMessageButton = UIcons.compose_message_button;
    expect(
      composeMessageButton,
      const UIconData(0xe80e, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const copyCloneButton = UIcons.copy_clone_button;
    expect(
      copyCloneButton,
      const UIconData(0xe80f, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const endCallIcon = UIcons.end_call_icon;
    expect(
      endCallIcon,
      const UIconData(0xe810, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const endVideoCallIcon = UIcons.end_video_call_icon;
    expect(
      endVideoCallIcon,
      const UIconData(0xe811, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const favoriteButton = UIcons.favorite_button;
    expect(
      favoriteButton,
      const UIconData(0xe812, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const fileIcon = UIcons.file_icon;
    expect(
      fileIcon,
      const UIconData(0xe813, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const forwardArrowButton = UIcons.forward_arrow_button;
    expect(
      forwardArrowButton,
      const UIconData(0xe814, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const friendAddedIcon = UIcons.friend_added_icon;
    expect(
      friendAddedIcon,
      const UIconData(0xe815, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const gridView = UIcons.grid_view;
    expect(
      gridView,
      const UIconData(0xe816, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const hamburgerMenu = UIcons.hamburger_menu;
    expect(
      hamburgerMenu,
      const UIconData(0xe817, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const lefthandNavigationDrawer = UIcons.lefthand_navigation_drawer;
    expect(
      lefthandNavigationDrawer,
      const UIconData(0xe818, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const linkButton = UIcons.link_button;
    expect(
      linkButton,
      const UIconData(0xe819, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const listView = UIcons.list_view;
    expect(
      listView,
      const UIconData(0xe81a, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const locationIcon = UIcons.location_icon;
    expect(
      locationIcon,
      const UIconData(0xe81b, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const menuBarContacts = UIcons.menu_bar_contacts;
    expect(
      menuBarContacts,
      const UIconData(0xe81c, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const menuBarFiles = UIcons.menu_bar_files;
    expect(
      menuBarFiles,
      const UIconData(0xe81d, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const menuBarHome = UIcons.menu_bar_home;
    expect(
      menuBarHome,
      const UIconData(0xe81e, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const menuBarNotifications = UIcons.menu_bar_notifications;
    expect(
      menuBarNotifications,
      const UIconData(0xe81f, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const messageIcon = UIcons.message_icon;
    expect(
      messageIcon,
      const UIconData(0xe820, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const multipleAccountsIcon = UIcons.multiple_accounts_icon;
    expect(
      multipleAccountsIcon,
      const UIconData(0xe821, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const muteIcon = UIcons.mute_icon;
    expect(
      muteIcon,
      const UIconData(0xe822, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const pinEntryBackspaceButton = UIcons.pin_entry_backspace_button;
    expect(
      pinEntryBackspaceButton,
      const UIconData(0xe823, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const qrCodeIcon = UIcons.qr_code_icon;
    expect(
      qrCodeIcon,
      const UIconData(0xe824, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const removeFriendIcon = UIcons.remove_friend_icon;
    expect(
      removeFriendIcon,
      const UIconData(0xe825, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const removeIcon = UIcons.remove_icon;
    expect(
      removeIcon,
      const UIconData(0xe826, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const rightArrowInlineButton = UIcons.right_arrow_inline_button;
    expect(
      rightArrowInlineButton,
      const UIconData(0xe827, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const saveButton = UIcons.save_button;
    expect(
      saveButton,
      const UIconData(0xe828, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const searchIcon = UIcons.search_icon;
    expect(
      searchIcon,
      const UIconData(0xe829, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const settingIcon = UIcons.setting_icon;
    expect(
      settingIcon,
      const UIconData(0xe82a, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const settingsLogoutIcon = UIcons.settings_logout_icon;
    expect(
      settingsLogoutIcon,
      const UIconData(0xe82b, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const swapCameraIcon = UIcons.swap_camera_icon;
    expect(
      swapCameraIcon,
      const UIconData(0xe82c, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const tapSelectBox = UIcons.tap_select_box;
    expect(
      tapSelectBox,
      const UIconData(0xe82d, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const unmuteIcon = UIcons.unmute_icon;
    expect(
      unmuteIcon,
      const UIconData(0xe82e, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const vectorStroke = UIcons.vector_stroke;
    expect(
      vectorStroke,
      const UIconData(0xe82f, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );

    const videoCallButton = UIcons.video_call_button;
    expect(
      videoCallButton,
      const UIconData(0xe830, uFontFamily: _kFontFam, uFontPackage: _kFontPkg),
    );
  });
}

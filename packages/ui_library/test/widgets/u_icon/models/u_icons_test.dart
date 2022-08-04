// ignore_for_file: constant_identifier_names

import 'package:ui_library/widgets/u_icon/u_icon_export.dart';
import 'package:given_when_then_unit_test/given_when_then_unit_test.dart';
import 'package:shouldly/shouldly.dart';

void main() {
  given('UICons Class - Color\'s HEX number', () {
    then(
        'UICon about should return correct HEX',
        () => UIcons.about.should
            .be(const UIconData(0xe900, uFontFamily: 'UIcons')),
        and: {
          'UIconData constructor should be called correctly': () {
            const _constructor = UIconData(0xe900, uFontFamily: 'UIcons');
            _constructor.uCodePoint.should.be(0xe900);
            _constructor.uFontFamily.should.be('UIcons');
            _constructor.uMatchTextDirection.should.be(false);
          },
          'UIcon account_id should return correct HEX': () => UIcons
              .account_id.should
              .be(const UIconData(0xe901, uFontFamily: 'UIcons')),
          'UIcon add should return correct HEX': () => UIcons.add.should
              .be(const UIconData(0xe902, uFontFamily: 'UIcons')),
          'UIcon add_contact should return correct HEX': () => UIcons
              .add_contact.should
              .be(const UIconData(0xe903, uFontFamily: 'UIcons')),
          'UIcon add_folder should return correct HEX': () => UIcons
              .add_folder.should
              .be(const UIconData(0xe904, uFontFamily: 'UIcons')),
          'UIcon add_note should return correct HEX': () => UIcons
              .add_note.should
              .be(const UIconData(0xe905, uFontFamily: 'UIcons')),
          'UIcon apple_watch should return correct HEX': () => UIcons
              .apple_watch.should
              .be(const UIconData(0xe906, uFontFamily: 'UIcons')),
          'UIcon audio_off should return correct HEX': () => UIcons
              .audio_off.should
              .be(const UIconData(0xe907, uFontFamily: 'UIcons')),
          'UIcon audio_on should return correct HEX': () => UIcons
              .audio_on.should
              .be(const UIconData(0xe908, uFontFamily: 'UIcons')),
          'UIcon back_arrow should return correct HEX': () => UIcons
              .back_arrow.should
              .be(const UIconData(0xe909, uFontFamily: 'UIcons')),
          'UIcon blocked_contacts should return correct HEX': () => UIcons
              .blocked_contacts.should
              .be(const UIconData(0xe90a, uFontFamily: 'UIcons')),
          'UIcon voice_call should return correct HEX': () => UIcons
              .voice_call.should
              .be(const UIconData(0xe90b, uFontFamily: 'UIcons')),
          'UIcon camera should return correct HEX': () => UIcons.camera.should
              .be(const UIconData(0xe90c, uFontFamily: 'UIcons')),
          'UIcon chatbar_emojis should return correct HEX': () => UIcons
              .chatbar_emojis.should
              .be(const UIconData(0xe90d, uFontFamily: 'UIcons')),
          'UIcon chatbar_gifs should return correct HEX': () => UIcons
              .chatbar_gifs.should
              .be(const UIconData(0xe90e, uFontFamily: 'UIcons')),
          'UIcon chatbar_send should return correct HEX': () => UIcons
              .chatbar_send.should
              .be(const UIconData(0xe90f, uFontFamily: 'UIcons')),
          'UIcon chatbar_stickers should return correct HEX': () => UIcons
              .chatbar_stickers.should
              .be(const UIconData(0xe910, uFontFamily: 'UIcons')),
          'UIcon checkmark_1 should return correct HEX': () => UIcons
              .checkmark_1.should
              .be(const UIconData(0xe911, uFontFamily: 'UIcons')),
          'UIcon checkmark_2 should return correct HEX': () => UIcons
              .checkmark_2.should
              .be(const UIconData(0xe912, uFontFamily: 'UIcons')),
          'UIcon close should return correct HEX': () => UIcons.close.should
              .be(const UIconData(0xe913, uFontFamily: 'UIcons')),
          'UIcon compose_message should return correct HEX': () => UIcons
              .compose_message.should
              .be(const UIconData(0xe914, uFontFamily: 'UIcons')),
          'UIcon copy_or_clone_button should return correct HEX': () => UIcons
              .copy_or_clone_button.should
              .be(const UIconData(0xe915, uFontFamily: 'UIcons')),
          'UIcon desktop should return correct HEX': () => UIcons.desktop.should
              .be(const UIconData(0xe916, uFontFamily: 'UIcons')),
          'UIcon developer should return correct HEX': () => UIcons
              .developer.should
              .be(const UIconData(0xe917, uFontFamily: 'UIcons')),
          'UIcon devices should return correct HEX': () => UIcons.devices.should
              .be(const UIconData(0xe918, uFontFamily: 'UIcons')),
          'UIcon dropdown_menu should return correct HEX': () => UIcons
              .dropdown_menu.should
              .be(const UIconData(0xe919, uFontFamily: 'UIcons')),
          'UIcon encrypted should return correct HEX': () => UIcons
              .encrypted.should
              .be(const UIconData(0xe91a, uFontFamily: 'UIcons')),
          'UIcon end_call should return correct HEX': () => UIcons
              .end_call.should
              .be(const UIconData(0xe91b, uFontFamily: 'UIcons')),
          'UIcon end_video_call should return correct HEX': () => UIcons
              .end_video_call.should
              .be(const UIconData(0xe91c, uFontFamily: 'UIcons')),
          'UIcon favorite should return correct HEX': () => UIcons
              .favorite.should
              .be(const UIconData(0xe91d, uFontFamily: 'UIcons')),
          'UIcon document should return correct HEX': () => UIcons
              .document.should
              .be(const UIconData(0xe91e, uFontFamily: 'UIcons')),
          'UIcon forward_arrow should return correct HEX': () => UIcons
              .forward_arrow.should
              .be(const UIconData(0xe91f, uFontFamily: 'UIcons')),
          'UIcon friend_added should return correct HEX': () => UIcons
              .friend_added.should
              .be(const UIconData(0xe920, uFontFamily: 'UIcons')),
          'UIcon friend_requests should return correct HEX': () => UIcons
              .friend_requests.should
              .be(const UIconData(0xe921, uFontFamily: 'UIcons')),
          'UIcon general should return correct HEX': () => UIcons.general.should
              .be(const UIconData(0xe922, uFontFamily: 'UIcons')),
          'UIcon go_back should return correct HEX': () => UIcons.go_back.should
              .be(const UIconData(0xe923, uFontFamily: 'UIcons')),
          'UIcon grid_view should return correct HEX': () => UIcons
              .grid_view.should
              .be(const UIconData(0xe924, uFontFamily: 'UIcons')),
          'UIcon hamburger_menu should return correct HEX': () => UIcons
              .hamburger_menu.should
              .be(const UIconData(0xe925, uFontFamily: 'UIcons')),
          'UIcon hide should return correct HEX': () => UIcons.hide.should
              .be(const UIconData(0xe926, uFontFamily: 'UIcons')),
          'UIcon image should return correct HEX': () => UIcons.image.should
              .be(const UIconData(0xe927, uFontFamily: 'UIcons')),
          'UIcon import should return correct HEX': () => UIcons.import.should
              .be(const UIconData(0xe928, uFontFamily: 'UIcons')),
          'UIcon laptop should return correct HEX': () => UIcons.laptop.should
              .be(const UIconData(0xe929, uFontFamily: 'UIcons')),
          'UIcon lefthand_navigation_drawer should return correct HEX': () =>
              UIcons.lefthand_navigation_drawer.should
                  .be(const UIconData(0xe92a, uFontFamily: 'UIcons')),
          'UIcon link should return correct HEX': () => UIcons.link.should
              .be(const UIconData(0xe92b, uFontFamily: 'UIcons')),
          'UIcon list_view should return correct HEX': () => UIcons
              .list_view.should
              .be(const UIconData(0xe92c, uFontFamily: 'UIcons')),
          'UIcon location should return correct HEX': () => UIcons
              .location.should
              .be(const UIconData(0xe92d, uFontFamily: 'UIcons')),
          'UIcon menu_bar_contacts should return correct HEX': () => UIcons
              .menu_bar_contacts.should
              .be(const UIconData(0xe92e, uFontFamily: 'UIcons')),
          'UIcon menu_bar_files should return correct HEX': () => UIcons
              .menu_bar_files.should
              .be(const UIconData(0xe92f, uFontFamily: 'UIcons')),
          'UIcon menu_bar_home should return correct HEX': () => UIcons
              .menu_bar_home.should
              .be(const UIconData(0xe930, uFontFamily: 'UIcons')),
          'UIcon notifications should return correct HEX': () => UIcons
              .notifications.should
              .be(const UIconData(0xe931, uFontFamily: 'UIcons')),
          'UIcon message should return correct HEX': () => UIcons.message.should
              .be(const UIconData(0xe932, uFontFamily: 'UIcons')),
          'UIcon mobile_phone should return correct HEX': () => UIcons
              .mobile_phone.should
              .be(const UIconData(0xe933, uFontFamily: 'UIcons')),
          'UIcon multiple_accounts should return correct HEX': () => UIcons
              .multiple_accounts.should
              .be(const UIconData(0xe934, uFontFamily: 'UIcons')),
          'UIcon mute should return correct HEX': () => UIcons.mute.should
              .be(const UIconData(0xe935, uFontFamily: 'UIcons')),
          'UIcon outgoing_requests should return correct HEX': () => UIcons
              .outgoing_requests.should
              .be(const UIconData(0xe936, uFontFamily: 'UIcons')),
          'UIcon pin_entry_backspace should return correct HEX': () => UIcons
              .pin_entry_backspace.should
              .be(const UIconData(0xe937, uFontFamily: 'UIcons')),
          'UIcon pinned_message should return correct HEX': () => UIcons
              .pinned_message.should
              .be(const UIconData(0xe938, uFontFamily: 'UIcons')),
          'UIcon qr_code should return correct HEX': () => UIcons.qr_code.should
              .be(const UIconData(0xe939, uFontFamily: 'UIcons')),
          'UIcon qr_code_scanner_border should return correct HEX': () => UIcons
              .qr_code_scanner_border.should
              .be(const UIconData(0xe93a, uFontFamily: 'UIcons')),
          'UIcon refresh should return correct HEX': () => UIcons.refresh.should
              .be(const UIconData(0xe93b, uFontFamily: 'UIcons')),
          'UIcon remove should return correct HEX': () => UIcons.remove.should
              .be(const UIconData(0xe93c, uFontFamily: 'UIcons')),
          'UIcon remove_friend should return correct HEX': () => UIcons
              .remove_friend.should
              .be(const UIconData(0xe93d, uFontFamily: 'UIcons')),
          'UIcon report should return correct HEX': () => UIcons.report.should
              .be(const UIconData(0xe93e, uFontFamily: 'UIcons')),
          'UIcon reveal should return correct HEX': () => UIcons.reveal.should
              .be(const UIconData(0xe93f, uFontFamily: 'UIcons')),
          'UIcon right_arrow_inline_row should return correct HEX': () => UIcons
              .right_arrow_inline_row.should
              .be(const UIconData(0xe940, uFontFamily: 'UIcons')),
          'UIcon download should return correct HEX': () => UIcons
              .download.should
              .be(const UIconData(0xe941, uFontFamily: 'UIcons')),
          'UIcon search should return correct HEX': () => UIcons.search.should
              .be(const UIconData(0xe942, uFontFamily: 'UIcons')),
          'UIcon security should return correct HEX': () => UIcons
              .security.should
              .be(const UIconData(0xe943, uFontFamily: 'UIcons')),
          'UIcon setting should return correct HEX': () => UIcons.setting.should
              .be(const UIconData(0xe944, uFontFamily: 'UIcons')),
          'UIcon logout should return correct HEX': () => UIcons.logout.should
              .be(const UIconData(0xe945, uFontFamily: 'UIcons')),
          'UIcon swap_camera should return correct HEX': () => UIcons
              .swap_camera.should
              .be(const UIconData(0xe946, uFontFamily: 'UIcons')),
          'UIcon tablet should return correct HEX': () => UIcons.tablet.should
              .be(const UIconData(0xe947, uFontFamily: 'UIcons')),
          'UIcon select_box should return correct HEX': () => UIcons
              .select_box.should
              .be(const UIconData(0xe948, uFontFamily: 'UIcons')),
          'UIcon unblock should return correct HEX': () => UIcons.unblock.should
              .be(const UIconData(0xe949, uFontFamily: 'UIcons')),
          'UIcon unencrypted should return correct HEX': () => UIcons
              .unencrypted.should
              .be(const UIconData(0xe94a, uFontFamily: 'UIcons')),
          'UIcon unmute should return correct HEX': () => UIcons.unmute.should
              .be(const UIconData(0xe94b, uFontFamily: 'UIcons')),
          'UIcon user_profile should return correct HEX': () => UIcons
              .user_profile.should
              .be(const UIconData(0xe94c, uFontFamily: 'UIcons')),
          'UIcon video_call should return correct HEX': () => UIcons
              .video_call.should
              .be(const UIconData(0xe94d, uFontFamily: 'UIcons')),
        });
  });
}

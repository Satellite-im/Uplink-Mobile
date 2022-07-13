import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/chat_index_page/mock_notifications.dart';
import 'package:uplink/chat/chat_index_page/models/search/chat_search.dart';
import 'package:uplink/chat/notifications_page.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_chats_list.dart';
import 'package:uplink/utils/mock/helpers/loading_favorites_chats_list.dart';
import 'package:uplink/utils/mock/models/mock_contacts_chat.dart';
import 'package:uplink/utils/ui_utils/search/show_custom_search.dart';

part 'models/favorites_friends.part.dart';
part 'models/with_friends.part.dart';
part 'models/without_friends_yet.part.dart';

class ChatIndexPage extends StatefulWidget {
  const ChatIndexPage({Key? key}) : super(key: key);

  @override
  State<ChatIndexPage> createState() => _ChatIndexPageState();
}

class _ChatIndexPageState extends State<ChatIndexPage> {
  Future<Map<String, List<MockContactsChat>>>
      _loadingFriendsAndFavoritesList() async {
    final _chatsList = await loadingChatsList();
    final _favoritesChatsList = await loadingFavoritesChatsList();

    // Todo(Lucas): Remove this function layer, just to show loading widget
    await Future.delayed(const Duration(seconds: 3), () {});

    return <String, List<MockContactsChat>>{
      'chats_list': _chatsList,
      'favorites_chats_list': _favoritesChatsList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map<String, List<MockContactsChat>>>(
          future: _loadingFriendsAndFavoritesList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: _UAppBar(),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        64,
                        MediaQuery.of(context).size.height / 4,
                        0,
                        0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const <Widget>[
                          ULoadingIndicator(
                            padding: EdgeInsets.zero,
                          ),
                          UText(
                            'Loading...',
                            textStyle: UTextStyle.H1_primaryHeader,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              final _friendsList = snapshot.data!['chats_list']!;
              final _favoritesList = snapshot.data!['favorites_chats_list']!;
              return Center(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: _UAppBar(),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FavoritesFriends(
                            favoritesFriendsList: _favoritesList,
                          ),
                          if (_friendsList.isNotEmpty) ...[
                            const SizedBox.square(
                              dimension: 14,
                            ),
                            _WithFriends(
                              friendsList: _friendsList,
                            ),
                          ] else
                            const _WithoutFriendsYet(),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class _UAppBar extends StatelessWidget {
  const _UAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UAppBar.actions(
      actionList: [
        IconButton(
          icon: const UIcon(
            UIcons.search,
            color: UColors.textMed,
          ),
          onPressed: () {
            showCustomSearch(
              context: context,
              delegate: ChatSearch(loadingChatsList()),
            );
          },
        ),
        IconButton(
          icon: const UIcon(
            UIcons.menu_bar_notifications,
            color: UColors.textMed,
          ),
          onPressed: () async {
            await UBottomSheetNotifications(
              context,
              uNotificationsList: uNotificationListMock,
              onSlideUp: () async {
                await Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute<Widget>(
                    fullscreenDialog: true,
                    builder: (context) => const NotificationsPage(),
                  ),
                );
              },
            ).show();
          },
        ),
        IconButton(
          icon: const UIcon(
            UIcons.compose_message_button,
            color: UColors.textMed,
          ),
          onPressed: () async {},
        ),
      ],
      leading: IconButton(
        icon: const UIcon(
          UIcons.lefthand_navigation_drawer,
          color: UColors.textMed,
        ),
        onPressed: () async {},
      ),
      title: UAppStrings.chatIndexPage_appBarTitle,
    );
  }
}

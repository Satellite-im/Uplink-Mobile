import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_chats_list.dart';
import 'package:uplink/utils/mock/helpers/loading_favorites_chats_list.dart';
import 'package:uplink/utils/mock/models/mock_contacts_chat.dart';

part 'models/favorites_friends.part.dart';
part 'models/with_friends.part.dart';
part 'models/without_friends_yet.part.dart';

class ChatIndexPage extends StatefulWidget {
  const ChatIndexPage({Key? key}) : super(key: key);

  @override
  State<ChatIndexPage> createState() => _ChatIndexPageState();
}

class _ChatIndexPageState extends State<ChatIndexPage> {
  @override
  Widget build(BuildContext context) {
    Future<Map<String, List<MockContactsChat>>>
        _loadingFriendsAndFavoritesList() async {
      final _chatsList = await loadingChatsList();
      final _favoritesChatsList = await loadingFavoritesChatsList();
      return <String, List<MockContactsChat>>{
        'chats_list': _chatsList,
        'favorites_chats_list': _favoritesChatsList,
      };
    }

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map<String, List<MockContactsChat>>>(
          future: _loadingFriendsAndFavoritesList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return UActionLoading(
                dashLoadingIndicatorPadding: const EdgeInsets.only(left: 32),
                isLoading: ValueNotifier(!snapshot.hasData),
                child: const SizedBox(),
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
                              dimension: 24,
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
          onPressed: () async {},
        ),
        IconButton(
          icon: const UIcon(
            UIcons.menu_bar_notifications,
            color: UColors.textMed,
          ),
          onPressed: () async {},
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

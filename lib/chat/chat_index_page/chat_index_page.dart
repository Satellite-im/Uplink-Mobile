import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_favorites_list.dart';
import 'package:uplink/utils/mock/helpers/loading_friends_list.dart';

part 'models/with_friends.part.dart';
part 'models/without_friends_yet.part.dart';
part 'models/favorites_friends.part.dart';
part 'mock/mock_friends_list.mock.dart';

class ChatIndexPage extends StatefulWidget {
  const ChatIndexPage({Key? key}) : super(key: key);

  @override
  State<ChatIndexPage> createState() => _ChatIndexPageState();
}

class _ChatIndexPageState extends State<ChatIndexPage> {
  @override
  Widget build(BuildContext context) {
    Future<void> _loadingFriendsAndFavoritesList() async {
      await loadingFriendsList();
      await loadingFavoritesFriendsList();
    }

    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: _loadingFriendsAndFavoritesList(),
          builder: (context, snapshot) {
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
                          favoritesFriendsList: _friendsList,
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
          },
        ),
      ),
    );
  }
}

class _UAppBar extends StatelessWidget with PreferredSizeWidget {
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

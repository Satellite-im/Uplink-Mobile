import 'package:flutter/material.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/chat/chat_index_page/models/search/chat_search.dart';
import 'package:uplink/chat/notifications_page.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/helpers/loading_chats_list.dart';
import 'package:uplink/utils/mock/helpers/loading_favorites_chats_list.dart';
import 'package:uplink/utils/mock/helpers/loading_notifications.dart';
import 'package:uplink/utils/mock/models/models_export.dart';
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
  Future<Map<String, List>> _loadingFriendsAndFavoritesList() async {
    final _chatsList = await loadingChatsList();
    final _favoritesChatsList = await loadingFavoritesChatsList();
    final _notificationsList = await loadingNotifications();

    // Todo(Lucas): Remove this function layer, just to show loading widget
    await Future.delayed(const Duration(seconds: 3), () {});

    return <String, List>{
      'chats_list': _chatsList,
      'favorites_chats_list': _favoritesChatsList,
      'notifications_list': _notificationsList,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Map<String, List>>(
          future: _loadingFriendsAndFavoritesList(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return CustomScrollView(
                slivers: [
                  const SliverToBoxAdapter(
                    child: _UAppBar(
                      mockNotificationsList: [],
                    ),
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
                            UAppStrings.chatIndexPage_loading,
                            textStyle: UTextStyle.H1_primaryHeader,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            } else {
              final _friendsList =
                  snapshot.data!['chats_list']! as List<MockContactsChat>;
              final _favoritesList = snapshot.data!['favorites_chats_list']!
                  as List<MockContactsChat>;
              final _notificationsList = snapshot.data!['notifications_list']!
                  as List<MockNotification>;
              return Center(
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: _UAppBar(
                        mockNotificationsList: _notificationsList,
                      ),
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

class _UAppBar extends StatefulWidget {
  const _UAppBar({
    Key? key,
    required this.mockNotificationsList,
  }) : super(key: key);

  final List<MockNotification> mockNotificationsList;

  @override
  State<_UAppBar> createState() => _UAppBarState();
}

class _UAppBarState extends State<_UAppBar> with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _initController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initController() {
    _controller = BottomSheet.createAnimationController(this);
    _controller
      ..duration = const Duration(milliseconds: 250)
      ..reverseDuration = const Duration(milliseconds: 125);
  }

  List<UNotification> _prepareNotifications() {
    final _uNotificationList = <UNotification>[];
    final _notificationsMockList = widget.mockNotificationsList;
    for (final _notification in _notificationsMockList) {
      final _uNotification = UNotification(
        isUnread: _notification.isUnread,
        username: _notification.username,
        arrivalNotificationTime: _notification.arrivalNotificationTime,
        notificationType: _notification.notificationType,
        message: _notification.message != null ? _notification.message! : '',
        uImage: _notification.uImage,
      );

      _uNotificationList.add(_uNotification);
    }
    return _uNotificationList;
  }

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
            final _uNotificationList = _prepareNotifications();
            await UBottomSheetNotifications(
              context,
              animationController: _controller,
              uNotificationsList: _uNotificationList,
              onSlideUp: () async {
                await Navigator.of(
                  context,
                ).push(
                  MaterialPageRoute<Widget>(
                    fullscreenDialog: true,
                    maintainState: false,
                    builder: (context) => NotificationsPage(
                      uNotificationsList: _uNotificationList,
                    ),
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/utils/mock/models/mock_contacts_chat.dart';
import 'package:uplink/utils/ui_utils/search/show_custom_search.dart';

class ChatSearch extends SearchCustomDelegate<MockContactsChat?> {
  ChatSearch(
    this.loadChatsList,
  );

  final Future<List<MockContactsChat>> loadChatsList;

  @override
  String get searchFieldLabel => 'Search Chats...';

  @override
  ThemeData appBarTheme(BuildContext context) {
    if (context.read<ThemeModel>().getThemeType == ThemeMode.dark) {
      return Theme.of(context).copyWith(
        appBarTheme: const AppBarTheme(color: UColors.backgroundDark),
      );
    }
    return context.read<ThemeModel>().getThemeData;
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const UIcon(
        UIcons.back_arrow,
        color: UColors.textMed,
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return const [SizedBox(width: 16)];
  }

  @override
  Widget buildResults(BuildContext context) {
    return _buildSuggestions();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return _buildSuggestions();
  }

  FutureBuilder<List<MockContactsChat>> _buildSuggestions() {
    return FutureBuilder(
      future: loadChatsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final chatsList = snapshot.data!;

          //show suggestion when user typed the first letter
          if (chatsList.isEmpty || query.isEmpty) {
            return const SizedBox.shrink();
          } else {
//Todo(Lucas): This logic will be changed to search for all messages in all app
            final suggestions = chatsList.where(
              (element) =>
                  element.uMessage.message
                      .toLowerCase()
                      .contains(query.toLowerCase()) ||
                  element.username.toLowerCase().contains(query.toLowerCase()),
            );
            final sortedSuggestions = suggestions.toList()
              ..sort(
                (a, b) => a.uMessage.message.compareTo(
                  b.uMessage.message,
                ),
              );

            return ListView.builder(
              itemCount: sortedSuggestions.length,
              itemBuilder: (context, index) {
                final _friend = sortedSuggestions[index];
                return InkWell(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  onTap: () {
                    //Todo(Lucas): Go to the chat or message in the future
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: UnreadMessagesUserProfileCard(
                      status: _friend.status,
                      username: _friend.username,
                      uMessage: _friend.uMessage,
                      unreadMessages: _friend.unreadMessages,
                      uImage: UImage(
                        imagePath: _friend.imagePath,
                        imageSource: ImageSource.local,
                      ),
                    ),
                  ),
                );
              },
            );
          }
        }
        // TODO(yijing): update to standard indicator
        return const Center(child: ULoadingIndicator());
      },
    );
  }
}

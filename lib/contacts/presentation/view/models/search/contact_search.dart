import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/models/contact_list_tile.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';
import 'package:uplink/utils/ui_utils/search/show_custom_search.dart';

class ContactSearch extends SearchCustomDelegate<MockContact?> {
  ContactSearch();

  @override
  String get searchFieldLabel => UAppStrings.contact_search;

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

  Widget _buildSuggestions() {
    final _friendController = GetIt.I.get<FriendBloc>();
    return BlocBuilder<FriendBloc, FriendState>(
      bloc: GetIt.I.get<FriendBloc>(),
      builder: (context, state) {
        if (_friendController.friendsList.isNotEmpty) {
          final contactsList = _friendController.friendsList;

          //show suggestion when user typed the first letter
          if (contactsList.isEmpty || query.isEmpty) {
            return const SizedBox.shrink();
          } else {
            final suggestions = contactsList.where(
              (element) => element.username
                  .toLowerCase()
                  .startsWith(query.toLowerCase()),
            );
            final sortedSuggestions = suggestions.toList()
              ..sort((a, b) => a.username.compareTo(b.username));

            return ListView.builder(
              itemCount: sortedSuggestions.length,
              itemBuilder: (context, index) {
                final item = sortedSuggestions[index];
                return ContactListTile(
                  name: item.username,
                  statusMessage: item.statusMessage,
                  status: item.status ?? Status.offline,
                  imageAddress: item.profilePicture?.path,
                  onTap: () {
                    // TODO(yijing): update to user profile page
                    UBottomSheet(
                      context,
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: double.infinity,
                        child: Text(item.username),
                      ),
                    ).show();
                  },
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

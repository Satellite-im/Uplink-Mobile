import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:ui_library/widgets/bottom_sheet/bottom_sheet_template.dart';
import 'package:uplink/contacts/models/contact_list_tile.dart';
import 'package:uplink/contacts/models/search/show_custom_search.dart';
import 'package:uplink/utils/mock/models/mock_contact.dart';

class ContactSearch extends SearchCustomDelegate<MockContact?> {
  ContactSearch(
    this.loadContactsList,
  );

  final Future<List<MockContact>> loadContactsList;

  @override
  String get searchFieldLabel => 'Search Contacts...';

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
        UIcons.back_arrow_button,
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

  FutureBuilder<List<MockContact>> _buildSuggestions() {
    return FutureBuilder(
      future: loadContactsList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final contactsList = snapshot.data!;

          //show suggestion when user typed the first letter
          if (contactsList.isEmpty || query.isEmpty) {
            return const SizedBox.shrink();
          } else {
            final suggestions = contactsList.where(
              (element) =>
                  element.name.toLowerCase().startsWith(query.toLowerCase()),
            );
            final sortedSuggestions = suggestions.toList()
              ..sort((a, b) => a.name.compareTo(b.name));

            return ListView.builder(
              itemCount: sortedSuggestions.length,
              itemBuilder: (context, index) {
                final item = sortedSuggestions[index];
                return ContactListTile(
                  name: item.name,
                  statusMessage: item.statusMessage,
                  status: item.status,
                  imageAddress: item.imageAddress,
                  onTap: () {
                    // TODO(yijing): update to user profile page
                    UBottomSheet(
                      context,
                      child: Container(
                        alignment: Alignment.center,
                        height: 200,
                        width: double.infinity,
                        child: Text(item.name),
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

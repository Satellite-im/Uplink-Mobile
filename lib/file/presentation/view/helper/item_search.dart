import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/widgets/file_index_body/models/file_list_view_builder.dart';
import 'package:uplink/l10n/main_app_strings.dart';
import 'package:uplink/utils/ui_utils/search/show_custom_search.dart';

class ItemSearch extends SearchCustomDelegate<Item?> {
  ItemSearch(
    this.loadItemList,
  );

  final Future<List<Item>> loadItemList;

  final _itemListController = GetIt.I.get<ItemListBloc>();

  @override
  String get searchFieldLabel => UAppStrings.item_search;

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
    // every time when the state of ItemListBLoc changes
    // the search result(keyboard closed) get rebuild
    return BlocBuilder<ItemListBloc, ItemListState>(
      bloc: _itemListController,
      builder: (context, state) {
        return _buildSuggestions();
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // every time when the state of ItemListBLoc changes
    // the search suggestion(keyboard is on) get rebuild
    return BlocBuilder<ItemListBloc, ItemListState>(
      bloc: _itemListController,
      builder: (context, state) {
        return _buildSuggestions();
      },
    );
  }

  FutureBuilder<List<Item>> _buildSuggestions() {
    return FutureBuilder(
      future: loadItemList,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final itemList = snapshot.data!;

          //show suggestion when user typed the first letter
          if (itemList.isEmpty || query.isEmpty) {
            return const SizedBox.shrink();
          } else {
            final suggestions = itemList.where(
              (element) =>
                  element.name.toLowerCase().startsWith(query.toLowerCase()),
            );
            final sortedSuggestions = suggestions.toList()
              ..sort((a, b) => a.name.compareTo(b.name));

            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: ListView.separated(
                itemCount: sortedSuggestions.length,
                itemBuilder: (context, index) {
                  final _item = sortedSuggestions[index];
                  Uint8List? _itemUnit8ListImage;
                  if (_item.thumbnail != null) {
                    _itemUnit8ListImage =
                        base64Decode(itemList[index].thumbnail!);
                  }

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListViewListTile(
                      item: _item,
                      itemUnit8ListImage: _itemUnit8ListImage,
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                  height: 24,
                ),
              ),
            );
          }
        }
        // TODO(yijing): update to standard indicator
        return const Center(child: ULoadingIndicator());
      },
    );
  }
}

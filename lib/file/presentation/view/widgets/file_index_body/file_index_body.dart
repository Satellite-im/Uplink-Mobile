import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/widgets/file_index_body/models/models_export.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class FileIndexBody extends StatefulWidget {
  const FileIndexBody.itemList({
    super.key,
  })  : isFavoritesList = false,
        isReomveList = false;

  const FileIndexBody.favoritesList({
    super.key,
  })  : isFavoritesList = true,
        isReomveList = false;

  const FileIndexBody.removeList({
    super.key,
  })  : isFavoritesList = false,
        isReomveList = true;

  final bool isFavoritesList;
  final bool isReomveList;

  @override
  State<FileIndexBody> createState() => _FileIndexBodyState();
}

class _FileIndexBodyState extends State<FileIndexBody> {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  late bool isGridView;
  @override
  void initState() {
    super.initState();
    isGridView = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//Layout Switch Part
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 10, 0),
          child: SizedBox(
            height: 40,
            child: Row(
              children: [
                Expanded(
                  child: BlocBuilder<ItemListBloc, ItemListState>(
                    bloc: _itemListController,
                    builder: (context, state) {
                      if (state is ItemListLoadSuccess) {
                        final int _listLength;

                        if (widget.isFavoritesList == true) {
                          final _favoritesList = state.itemList
                              .where((element) => element.isFavorited == true);
                          _listLength = _favoritesList.length;
                        } else {
                          _listLength = state.itemList.length;
                        }
                        // # of items
                        return UText(
                          state.itemList.isEmpty
                              ? UAppStrings.file_index_page_no_items
                              : _listLength.toString() +
                                  UAppStrings.file_index_page_items,
                          textStyle: UTextStyle.H5_fifthHeader,
                        );
                      } else if (state is ItemListLoadFailure) {
                        return const UText(
                          UAppStrings.file_index_page_items_in_error,
                          textStyle: UTextStyle.H5_fifthHeader,
                        );
                      }
                      return const UShimmer.med(
                        child: URectContainer(
                          height: 18,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                ItemLayoutButton(
                  onPressed: () {
                    if (isGridView == false) {
                      setState(() {
                        isGridView = true;
                      });
                    }
                  },
                  isSelected: isGridView,
                  uIconData: UIcons.grid_view,
                ),
                const SizedBox(width: 12),
                ItemLayoutButton(
                  onPressed: () {
                    if (isGridView == true) {
                      setState(() {
                        isGridView = false;
                      });
                    }
                  },
                  isSelected: !isGridView,
                  uIconData: UIcons.list_view,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
// photos/items list
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ItemListBloc, ItemListState>(
              bloc: _itemListController,
              builder: (context, state) {
                if (state is ItemListLoadSuccess) {
                  final _itemList = state.itemList;
                  // For FavoritesListPage(filter items)
                  if (widget.isFavoritesList == true) {
                    // For FavoritesListPage
                    final _favoritesList = _itemList
                        .where((element) => element.isFavorited == true)
                        .toList();
                    if (_favoritesList.isEmpty) {
                      return const Text(
                        UAppStrings.file_index_body_no_favorited_item,
                      );
                    }

                    return isGridView
                        ? FileGridViewBuilder(
                            itemList: _favoritesList,
                          )
                        : FileListViewBuilder(
                            itemList: _favoritesList,
                          );
                  } else if (widget.isReomveList == true) {
                    // For RemoveListPage
                    if (_itemList.isEmpty) {
                      return const Text(
                        UAppStrings.file_index_body_no_item_to_remove,
                      );
                    }
                    return isGridView
                        ? FileGridViewBuilder(
                            itemList: _itemList,
                            isRemoveList: true,
                          )
                        : FileListViewBuilder(
                            itemList: _itemList,
                            isRemoveList: true,
                          );
                  } else {
                    // For FileIndexPage
                    if (_itemList.isEmpty) {
                      return const NoItemBody();
                    }
                    return isGridView
                        ? FileGridViewBuilder(
                            itemList: _itemList,
                          )
                        : FileListViewBuilder(
                            itemList: _itemList,
                          );
                  }
                } else if (state is ItemListLoadFailure) {
                  return const UText(
                    UAppStrings.file_index_page_load_in_error,
                    textStyle: UTextStyle.H5_fifthHeader,
                  );
                }
                // Initial and loading state
                return const LoadingGridView();
              },
            ),
          ),
        ),
      ],
    );
  }
}

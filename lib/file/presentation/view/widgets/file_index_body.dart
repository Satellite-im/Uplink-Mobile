// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/helper/show_file_options_bottom_sheet.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class FileIndexBody extends StatefulWidget {
  const FileIndexBody({
    super.key,
    this.isFavoritesList = false,
    this.isReomveList = false,
  });

  final bool isFavoritesList;
  final bool isReomveList;

  @override
  State<FileIndexBody> createState() => _FileIndexBodyState();
}

class _FileIndexBodyState extends State<FileIndexBody> {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  late bool gridViewIsSelected;
  @override
  void initState() {
    super.initState();
    gridViewIsSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
//Item layout bar
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
                    setState(() {
                      gridViewIsSelected = true;
                    });
                  },
                  isSelected: gridViewIsSelected,
                  uIconData: UIcons.grid_view,
                ),
                const SizedBox(width: 12),
                ItemLayoutButton(
                  onPressed: () {
                    setState(() {
                      gridViewIsSelected = false;
                    });
                  },
                  isSelected: !gridViewIsSelected,
                  uIconData: UIcons.list_view,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 4),
// photos list
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocBuilder<ItemListBloc, ItemListState>(
              bloc: _itemListController,
              builder: (context, state) {
                if (state is ItemListLoadSuccess) {
                  // favorites list
                  if (widget.isFavoritesList == true) {
                    final _favoritesList = state.itemList
                        .where((element) => element.isFavorited == true)
                        .toList();
                    if (_favoritesList.isEmpty) {
                      return Text('no favorite item');
                    }
                    // item list
                    return gridViewIsSelected
                        ? ItemGridView(
                            itemList: _favoritesList,
                          )
                        : ItemListView(
                            itemList: _favoritesList,
                          );
                  }
                  if (state.itemList.isEmpty) {
                    return const NoItemBody();
                  }
                  return gridViewIsSelected
                      ? ItemGridView(
                          itemList: state.itemList,
                        )
                      : ItemListView(
                          itemList: state.itemList,
                        );
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

class ItemListView extends StatelessWidget {
  const ItemListView({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  final List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final _item = itemList[index];
        Uint8List? _itemUnit8ListImage;
        if (itemList[index].thumbnail != null) {
          _itemUnit8ListImage = base64Decode(itemList[index].thumbnail!);
        }
        return Column(
          children: [
            Card(
              color: UColors.backgroundDark,
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: UColors.foregroundDark),
                borderRadius: BorderRadius.circular(4),
              ),
              margin: EdgeInsets.zero,
              child: ListTile(
                dense: true,
                visualDensity: const VisualDensity(vertical: -1),
                leading: _item.type == ItemType.photo
                    ? Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(4),
                          ),
                          image: DecorationImage(
                            image: MemoryImage(_itemUnit8ListImage!),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    // TODO(yijing): add thumbnail for non-photo item
                    : Container(
                        height: 40,
                        width: 40,
                        color: UColors.foregroundDark,
                      ),
                title: UText(
                  _item.name,
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
                // TODO(yijing): update size unit
                subtitle: UText(
                  _item.size.toFileSize(decimals: 1),
                  textStyle: UTextStyle.M1_micro,
                ),
                trailing: IconButton(
                  icon: const UIcon(UIcons.hamburger_menu),
                  onPressed: () {
                    showFileOptionsBottomSheet(context, _item);
                  },
                  visualDensity: const VisualDensity(horizontal: -2),
                ),
                contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
              ),
            ),
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 24,
      ),
    );
  }
}

class ItemGridView extends StatelessWidget {
  const ItemGridView({
    Key? key,
    required this.itemList,
  }) : super(key: key);

  final List<Item> itemList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 160 / 168,
      ),
      itemCount: itemList.length,
      itemBuilder: (context, index) {
        final _item = itemList[index];
        final _imageUint8List = base64.decode(_item.thumbnail!);
        if (itemList[index].type == ItemType.photo) {
          final _item = itemList[index];
          return GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed('/PhotoDetailPage', arguments: _item);
            },
            onLongPress: () {
              showFileOptionsBottomSheet(context, _item);
            },
            child: UImageButton.unit8ListImage(
              unit8ListImage: _imageUint8List,
              isFavored: _item.isFavorited,
            ),
          );
        }
        // TODO(yijing): show thumbnail when item is not photo
        return const SizedBox.shrink();
      },
    );
  }
}

extension on int {
  String toFileSize({int decimals = 0}) {
    final suffixes = ['B', 'KB', 'MB', 'GB', 'TB'];
    final i = (log(this) / log(1024)).floor();
    return '${(this / pow(1024, i)).toStringAsFixed(decimals)} ${suffixes[i]}';
  }
}

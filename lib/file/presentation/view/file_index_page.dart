// ignore_for_file: lines_longer_than_80_chars

import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/file/presentation/view/widgets/loading_gridview.dart';
import 'package:uplink/file/presentation/view/widgets/widgets_export.dart';
import 'package:uplink/l10n/main_app_strings.dart';

class FileIndexPage extends StatefulWidget {
  const FileIndexPage({Key? key}) : super(key: key);

  @override
  State<FileIndexPage> createState() => _FileIndexPageState();
}

class _FileIndexPageState extends State<FileIndexPage> {
  final _itemListController = GetIt.I.get<ItemListBloc>();
  late bool gridViewIsSelected;
  @override
  void initState() {
    super.initState();
    gridViewIsSelected = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size(double.infinity, kToolbarHeight),
        child: FileIndexAppbar(),
      ),
      body: Column(
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
                          return UText(
                            state.itemList.isEmpty
                                ? UAppStrings.file_index_page_no_items
                                : state.itemList.length.toString() +
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
      ),
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
        final _itemName = itemList[index].name;
        final _itemSize = itemList[index].size;
        final _itemType = itemList[index].type;
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
                leading: _itemType == ItemType.photo
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
                  _itemName,
                  textStyle: UTextStyle.H5_fifthHeader,
                  textColor: UColors.white,
                ),
                // TODO(yijing): update size unit
                subtitle: UText(
                  _itemSize.toFileSize(decimals: 1),
                  textStyle: UTextStyle.M1_micro,
                ),
                trailing: IconButton(
                  icon: const UIcon(UIcons.hamburger_menu),
                  onPressed: () {},
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
              UBottomSheetOptions(
                context,
                sheetTitle: 'File Options',
                titleList: [
                  if (_item.isFavorited) 'Favorited' else 'Favorite',
                  'Copy',
                  'Rename',
                  'Save',
                  'Remove',
                ],
                iconList: [
                  UIcons.favorite,
                  UIcons.copy_or_clone_button,
                  UIcons.edit,
                  UIcons.download,
                  UIcons.remove
                ],
                colorList: [
                  if (_item.isFavorited) UColors.ctaBlue else UColors.white,
                  UColors.white,
                  UColors.white,
                  UColors.white,
                  UColors.white,
                ],
                onTapList: [
                  () {
                    // TODO(yijing): add workflow later
                  },
                  () {
                    // TODO(yijing): add workflow later
                  },
                  () {
                    // TODO(yijing): add workflow later
                  },
                  () {
                    // TODO(yijing): add workflow later
                  },
                  () {
                    // TODO(yijing): add workflow later
                  },
                ],
              ).show();
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

class ItemLayoutButton extends StatelessWidget {
  const ItemLayoutButton({
    Key? key,
    required this.onPressed,
    required this.isSelected,
    required this.uIconData,
  }) : super(key: key);

  final VoidCallback onPressed;
  final bool isSelected;
  final UIconData uIconData;
  @override
  Widget build(BuildContext context) {
    return Ink(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isSelected ? UColors.ctaDark : UColors.backgroundDark,
      ),
      child: Center(
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: onPressed,
          icon: UIcon(
            uIconData,
            color: isSelected ? UColors.white : UColors.textMed,
          ),
        ),
      ),
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

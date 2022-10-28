import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/ui_library_export.dart';

import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/view/helper/show_file_options_bottom_sheet.dart';
import 'package:uplink/file/presentation/view/photo_detail_page.dart';
import 'package:uplink/file/presentation/view/remove_list_page/models/selected_item_list.dart';
import 'package:uplink/file/presentation/view/widgets/file_index_body/models/models_export.dart';

class FileListViewBuilder extends StatelessWidget {
  const FileListViewBuilder({
    super.key,
    required this.itemList,
    this.isRemoveList = false,
  });
  final List<Item> itemList;
  final bool isRemoveList;

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

        return ListViewListTile(
          item: _item,
          itemUnit8ListImage: _itemUnit8ListImage,
          isRemoveList: isRemoveList,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        height: 24,
      ),
    );
  }
}

class ListViewListTile extends StatefulWidget {
  const ListViewListTile({
    Key? key,
    required this.item,
    required this.itemUnit8ListImage,
    this.isRemoveList = false,
  }) : super(key: key);

  final Item item;
  final Uint8List? itemUnit8ListImage;
  final bool isRemoveList;

  @override
  State<ListViewListTile> createState() => _ListViewListTileState();
}

class _ListViewListTileState extends State<ListViewListTile> {
  @override
  Widget build(BuildContext context) {
    final _item = widget.item;

    return Card(
      color: UColors.backgroundDark,
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: UColors.foregroundDark),
        borderRadius: BorderRadius.circular(4),
      ),
      margin: EdgeInsets.zero,
      child: ListTile(
        dense: true,
        visualDensity: const VisualDensity(vertical: -1),
        onTap: () {
          Navigator.of(context)
              .pushNamed(PhotoDetailPage.routeName, arguments: _item);
        },
        leading: _item.type == ItemType.photo
            ? Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(4),
                  ),
                  image: DecorationImage(
                    image: MemoryImage(widget.itemUnit8ListImage!),
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
        subtitle: UText(
          widget.item.size!.toFileSize(decimals: 1),
          textStyle: UTextStyle.M1_micro,
        ),
        trailing: TrailingWidget(
          item: _item,
          isRemoveList: widget.isRemoveList,
        ),
        contentPadding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
      ),
    );
  }
}

class TrailingWidget extends StatefulWidget {
  const TrailingWidget({
    Key? key,
    required this.item,
    required this.isRemoveList,
  }) : super(key: key);

  final Item item;
  final bool isRemoveList;

  @override
  State<TrailingWidget> createState() => _TrailingWidgetState();
}

class _TrailingWidgetState extends State<TrailingWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.isRemoveList == true) {
      var _isChecked = false;
      if (context
          .read<SelectedItemList>()
          .selectedItemList
          .contains(widget.item)) {
        _isChecked = true;
      }
      return IconButton(
        icon: UIcon(
          _isChecked == false ? UIcons.select_box : UIcons.checkmark_1,
        ),
        onPressed: () {
          if (_isChecked == false) {
            setState(() {
              context.read<SelectedItemList>().add(widget.item);
            });
          } else {
            setState(() {
              context.read<SelectedItemList>().remove(widget.item);
            });
          }
        },
        visualDensity: const VisualDensity(horizontal: -2),
      );
    }
    return IconButton(
      icon: const UIcon(
        UIcons.hamburger_menu,
      ),
      onPressed: () {
        showFileOptionsBottomSheet(context, widget.item);
      },
      visualDensity: const VisualDensity(horizontal: -2),
    );
  }
}

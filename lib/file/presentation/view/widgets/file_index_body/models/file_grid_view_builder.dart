import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ui_library/widgets/buttons/u_image_button/u_image_button.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/view/helper/show_file_options_bottom_sheet.dart';
import 'package:uplink/file/presentation/view/remove_list_page/models/selected_item_list.dart';

class FileGridViewBuilder extends StatelessWidget {
  const FileGridViewBuilder({
    super.key,
    required this.itemList,
    this.isRemoveList = false,
  });

  final List<Item> itemList;
  final bool isRemoveList;

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
          //Item in RemoveListPage
          if (isRemoveList == true) {
            return StatefulBuilder(
              builder: (context, setState) {
                var _isChecked = false;

                if (context
                    .read<SelectedItemList>()
                    .selectedItemList
                    .contains(_item)) {
                  _isChecked = true;
                }
                return UImageButton.unit8ListImage(
                  unit8ListImage: _imageUint8List,
                  isFavored: _item.isFavorited,
                  isDeleting: true,
                  isChecked: _isChecked,
                  onSelected: () {
                    setState(() {
                      context.read<SelectedItemList>().add(_item);
                    });
                  },
                  unSelected: () {
                    setState(() {
                      context.read<SelectedItemList>().remove(_item);
                    });
                  },
                );
              },
            );
          }
          // Item in the FileIndexPage and FavoriteListPage
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

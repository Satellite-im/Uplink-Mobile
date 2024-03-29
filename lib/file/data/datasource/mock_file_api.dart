// ignore_for_file: unused_import

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:uplink/file/data/datasource/i_file_datasource.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/utils/helpers/base_64.dart';
import 'package:uplink/utils/mock/data/mock_base64_str.dart';

class MockFileApi implements IFileDatasource {
  List<Item> itemList = <Item>[];

  @override
  Future<void> uploadItem(Item item) async {
    await Future.delayed(
      const Duration(milliseconds: 500),
      () async {
        itemList.add(item);

        // for test multiple items
        // final _file = await Base64Convert()
        //     .transformBase64ImageIntoFileImage(mockBase64Str, 'mock photo');
        // await Future.delayed(
        //   const Duration(milliseconds: 500),
        //   () {
        //     itemList = List.generate(
        //       10,
        //       (index) => Item(
        //         name: 'Photo Name $index',
        //         thumbnail: mockBase64Str,
        //         file: _file!,
        //         type: ItemType.photo,
        //         isFavorited: true,
        //         size: 378,
        //         creationDateTime: DateTime.now(),
        //         modifiedDateTime: DateTime.now(),
        //       ),
        //     );
        //   },
        // );
      },
    );
  }

  @override
  Future<List<Item>> getItemList() async {
    // mock item list
    const _hasItem = true;

    if (_hasItem == true) {
      await Future.delayed(
        const Duration(milliseconds: 100),
        () {},
      );
    }
    return itemList;
  }

  @override
  Future<void> switchFavoriteStatus(Item item) async {
    await Future.delayed(
      const Duration(milliseconds: 10),
      () {
        item.isFavorited = !item.isFavorited;
      },
    );
  }

  @override
  Future<void> renameItem({required Item item, required String name}) async {
    await Future.delayed(
      const Duration(milliseconds: 10),
      () {
        item.name = name;
      },
    );
  }

  @override
  Future<void> removeItems(List<Item> removeItemsList) async {
    await Future.delayed(
      const Duration(milliseconds: 10),
      () {
        for (final removeItem in removeItemsList) {
          //remove where the name is the same
          itemList.removeWhere((element) => element.name == removeItem.name);
        }
      },
    );
  }

  @override
  Future<void> removeSingleItem(Item item) async {
    await Future.delayed(const Duration(milliseconds: 10), () {
      itemList.removeWhere((element) => element.name == item.name);
    });
  }
}

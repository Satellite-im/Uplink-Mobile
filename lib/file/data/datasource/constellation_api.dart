// ignore_for_file: prefer_final_locals

import 'dart:convert';
import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as path;
import 'package:ui_library/core/utils/date_format.dart';
import 'package:uplink/file/data/datasource/file_api.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/costellation.dart' as constellation;

final _warpBloc = GetIt.I.get<WarpBloc>();

class ConstellationApi implements IFileApi {
// turn the data from constellation to the class used in UI
  @override
  Future<List<Item>> getItemList() async {
    var _result = <Item>[];
    if (_warpBloc.constellation == null) {
      log("constellation doesn't exist");
    } else {
      final _rootDirectory = _warpBloc.constellation!.getRootDirectory();
      final _itemList = _rootDirectory.listItems();
      for (final element in _itemList) {
        _result.add(await element.toItem);
      }
    }
    return _result;
  }

  @override
  Future<void> removeItems(List<Item> itemList) async {
    log('removeItems');
  }

  @override
  Future<void> removeSingleItem(Item item) async {
    log('removeSingleItem');
  }

  @override
  Future<void> renameItem({required Item item, required String name}) async {
    log('renameItem');
  }

  @override
  Future<void> switchFavoriteStatus(Item item) async {
    log('switchFavoriteStatus');
  }

  @override
  Future<void> uploadItem(Item item) async {
    if (item.type == ItemType.photo && item.file != null) {
      final _itemFileExtension = path.extension(item.file!.path);
// TODO(yijing): add item path when app support directory
      final _remotePath = item.name + _itemFileExtension;

      _warpBloc.constellation!.uploadToFilesystem(_remotePath, item.file!.path);
    } else {
      throw Exception("Unexpected item type to upload/File doesn't exist");
    }
  }
}

extension on constellation.Item {
  //transform the Item in constellation to the Item in App

  Future<Item> get toItem async {
    final _name = path.withoutExtension(name());
    final _size = size();
    final _uint8List = _warpBloc.constellation!.downloadFileIntoBuffer(name());
    //file name withExtension
    // TODO(yijing): update thumbnail to the thumbnail from warp
    final _thumbnail = base64Encode(_uint8List);
    final _creationDateTime =
        DateFormatUtils.covertUTCStringToDateTime(creation());
    final _modifiedDateTime =
        DateFormatUtils.covertUTCStringToDateTime(modification());

    return Item(
      // TODO(yijing): change to other type when app has more type of file
      type: ItemType.photo,
      name: _name,
      size: _size,
      preview: _uint8List,
      thumbnail: _thumbnail,
      creationDateTime: _creationDateTime,
      modifiedDateTime: _modifiedDateTime,
    );
  }
}

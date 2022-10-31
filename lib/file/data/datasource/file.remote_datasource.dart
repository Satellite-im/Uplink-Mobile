// ignore_for_file: prefer_final_locals

import 'dart:convert';
import 'dart:developer';
import 'package:get_it/get_it.dart';
import 'package:path/path.dart' as path;
import 'package:ui_library/core/utils/date_format.dart';
import 'package:uplink/file/data/datasource/i_file_datasource.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/services/warp/warp_constellation.dart';
import 'package:warp_dart/costellation.dart' as constellation;

// turn the data from constellation to the class used in UI
class FileData implements IFileDatasource {
  FileData(this._constellation);
  final WarpConstellation _constellation;

  @override
  Future<List<Item>> getItemList() async {
    var _result = <Item>[];

    try {
      final _itemList = _constellation.listItemsInRoot();
      for (final element in _itemList) {
        _result.add(await element.toItem);
      }
    } catch (e) {
      log('FileData->getItemList Failed');
      throw Exception(e);
    }

    return _result;
  }

  @override
  Future<void> removeItems(List<Item> itemList) async {
    log('removeItems');
  }

  @override
  Future<void> removeSingleItem(Item item) async {
    try {
      final _nameInConstellation = item.name + item.extension;
      _constellation.removeItem(_nameInConstellation);
    } catch (e) {
      log('FileData->removeSingleItem Failed');
      throw Exception(e);
    }
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
      try {
        final _itemFileExtension = path.extension(item.file!.path);
// TODO(yijing): add item path when app support directory
        final _remotePath = item.name + _itemFileExtension;
        _constellation.uploadToFilesystem(_remotePath, item.file!.path);
      } catch (e) {
        log('FileData -> uploadItem Failed');
        throw Exception(e);
      }
    } else {
      throw Exception("Unexpected item type to upload/File doesn't exist");
    }
  }
}

extension on constellation.Item {
  //transform the Item in constellation to the Item in App

  Future<Item> get toItem async {
    try {
      final _constellation = GetIt.I.get<WarpBloc>().constellation!;
      final _name = path.withoutExtension(name());
      final _extension = path.extension(name());
      final _size = size();
      final _uint8List = _constellation.downloadFileIntoBuffer(name());
      // TODO(yijing): update thumbnail to the thumbnail from warp
      final _thumbnail = base64Encode(_uint8List);
      final _creationDateTime =
          DateFormatUtils.covertUTCStringToDateTime(creation());
      final _modifiedDateTime =
          DateFormatUtils.covertUTCStringToDateTime(modification());

      return Item(
        // TODO(yijing): change to other type when app has more type of file
        type: ItemType.photo,
        extension: _extension,
        name: _name,
        size: _size,
        preview: _uint8List,
        thumbnail: _thumbnail,
        creationDateTime: _creationDateTime,
        modifiedDateTime: _modifiedDateTime,
      );
    } catch (e) {
      log('extension -> toItem Failed');
      throw Exception(e);
    }
  }
}

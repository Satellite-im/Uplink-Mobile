// ignore_for_file: prefer_final_locals, cascade_invocations

import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/costellation.dart' as constellation;

class WarpConstellation {
  final _warpBloc = GetIt.I.get<WarpBloc>();

  List<constellation.Item> listItemsInRoot() {
    var _itemList = <constellation.Item>[];
    try {
      final _rootDirectory = _warpBloc.constellation!.getRootDirectory();
      _itemList = _rootDirectory.listItems();
    } catch (e) {
      log('WarpConstellation->listItemsInRoot Failed');
      throw Exception(e);
    }

    return _itemList;
  }

  void uploadToFilesystem(String remotePath, String localPath) {
    try {
      _warpBloc.constellation!.uploadToFilesystem(remotePath, localPath);
    } catch (e) {
      log('WarpConstellation->uploadToFilesystem Failed');
      throw Exception(e);
    }
  }

  void removeItem(String name) {
    try {
      final _rootDirectory = _warpBloc.constellation!.getRootDirectory();
      _rootDirectory.removeItem(name);
    } catch (e) {
      log('WarpConstellation->removeItem Failed');
      throw Exception(e);
    }
  }
}

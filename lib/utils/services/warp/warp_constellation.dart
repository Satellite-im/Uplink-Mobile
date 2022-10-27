import 'package:get_it/get_it.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:warp_dart/costellation.dart' as constellation;

class WarpConstellaiton {
  final _warpBloc = GetIt.I.get<WarpBloc>();

  List<constellation.Item> listItemsInRoot() {
    final _rootDirectory = _warpBloc.constellation!.getRootDirectory();
    final _itemList = _rootDirectory.listItems();
    return _itemList;
  }

  void uploadToFilesystem(String remotePath, String localPath) {
    _warpBloc.constellation!.uploadToFilesystem(remotePath, localPath);
  }
}

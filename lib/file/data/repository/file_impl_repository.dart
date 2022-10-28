import 'package:uplink/file/data/data_export.dart';
import 'package:uplink/file/domain/item.dart';

class FileRepositoryImpl implements IFileRepository {
  FileRepositoryImpl(this._fileDatasource);

  final IFileDatasource _fileDatasource;

  @override
  Future<List<Item>> getItemList() => _fileDatasource.getItemList();

  @override
  Future<void> uploadItem(Item item) => _fileDatasource.uploadItem(item);
  @override
  Future<void> switchFavoriteStatus(Item item) =>
      _fileDatasource.switchFavoriteStatus(item);
  @override
  Future<void> renameItem({required Item item, required String name}) =>
      _fileDatasource.renameItem(item: item, name: name);

  @override
  Future<void> removeItems(List<Item> removedItemList) =>
      _fileDatasource.removeItems(removedItemList);

  @override
  Future<void> removeSingleItem(Item item) =>
      _fileDatasource.removeSingleItem(item);
}

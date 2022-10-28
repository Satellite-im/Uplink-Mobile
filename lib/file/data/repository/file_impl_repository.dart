import 'package:uplink/file/data/data_export.dart';
import 'package:uplink/file/domain/item.dart';

class FileRepositoryImpl implements IFileRepository {
  FileRepositoryImpl(this._fileApi);

  final IFileDatasource _fileApi;

  @override
  Future<List<Item>> getItemList() => _fileApi.getItemList();

  @override
  Future<void> uploadItem(Item item) => _fileApi.uploadItem(item);
  @override
  Future<void> switchFavoriteStatus(Item item) =>
      _fileApi.switchFavoriteStatus(item);
  @override
  Future<void> renameItem({required Item item, required String name}) =>
      _fileApi.renameItem(item: item, name: name);

  @override
  Future<void> removeItems(List<Item> removedItemList) =>
      _fileApi.removeItems(removedItemList);

  @override
  Future<void> removeSingleItem(Item item) => _fileApi.removeSingleItem(item);
}

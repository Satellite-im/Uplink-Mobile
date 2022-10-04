import 'package:uplink/file/data/data_export.dart';
import 'package:uplink/file/domain/item.dart';

class FileRepositoryImpl implements IFileRepository {
  FileRepositoryImpl(this._fileApi);

  final IFileApi _fileApi;

  @override
  Future<List<Item>> getItemList() => _fileApi.getItemList();

  @override
  Future<void> uploadItem(Item item) => _fileApi.uploadItem(item);
  @override
  Future<void> switchFavoriteStatus(Item item) =>
      _fileApi.switchFavoriteStatus(item);
}

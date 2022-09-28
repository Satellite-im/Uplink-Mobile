import 'package:uplink/file/data/datasource/file_api.dart';
import 'package:uplink/file/domain/item.dart';

class FileRepository {
  FileRepository(this._fileApi);

  final FileApi _fileApi;

  Future<List<Item>> getItemList() => _fileApi.getItemList();
}

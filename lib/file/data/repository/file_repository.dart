import 'package:uplink/file/domain/item.dart';

abstract class IFileRepository {
  Future<List<Item>> getItemList();
  Future<void> uploadItem(Item item);
}

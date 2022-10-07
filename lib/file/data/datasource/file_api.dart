import 'package:uplink/file/domain/item.dart';

abstract class IFileApi {
  // TODO(yijing): create a concrete class to communicate with constellation

  Future<List<Item>> getItemList();
  Future<void> uploadItem(Item item);
  Future<void> switchFavoriteStatus(Item item);
  Future<void> renameItem({required Item item, required String name});
  Future<void> removeItems(List<Item> itemList);
}

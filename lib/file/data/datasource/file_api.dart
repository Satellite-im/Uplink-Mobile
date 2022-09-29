// ignore_for_file: one_member_abstracts

import 'package:uplink/file/domain/item.dart';

abstract class IFileApi {
  // TODO(yijing): create a concrete class to communicate with constellation

  Future<List<Item>> getItemList();
  Future<void> uploadItem(Item item);
}

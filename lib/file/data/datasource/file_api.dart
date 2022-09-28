// ignore_for_file: one_member_abstracts

import 'package:uplink/file/domain/item.dart';

abstract class FileApi {
  // TODO(yijing): create a concrete class to communicate with constellation

  Future<List<Item>> getItemList();
}

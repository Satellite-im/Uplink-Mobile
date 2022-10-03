// ignore_for_file: one_member_abstracts

import 'package:uplink/file/domain/item.dart';

abstract class IFileRepository {
  Future<List<Item>> getItemList();
}

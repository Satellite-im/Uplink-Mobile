import 'package:uplink/file/data/datasource/file_api.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/utils/mock/data/mock_base64_str.dart';

class MockFileApi implements FileApi {
  @override
  Future<List<Item>> getItemList() async {
    var itemList = <Item>[];
    // mock item list
    const _hasItem = true;

    if (_hasItem == true) {
      await Future.delayed(const Duration(seconds: 1), () {
        itemList = List.generate(
          10,
          (index) => Item(
            name: 'Photo Name $index',
            thumbnail: mockBase64Str,
            type: ItemType.photo,
            isFavorited: true,
            size: 378,
            creation: DateTime.now(),
            modified: DateTime.now(),
          ),
        );
      });
    }
    return itemList;
  }
}

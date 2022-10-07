import 'package:flutter/foundation.dart';
import 'package:uplink/file/domain/item.dart';

// The class for storaging the selected item in RemoveListPage
class SelectedItemList extends ChangeNotifier {
  List<Item> selectedItemList = [];

  void add(Item item) {
    selectedItemList.add(item);
    notifyListeners();
  }

  void remove(Item item) {
    selectedItemList.remove(item);
    notifyListeners();
  }

  void clear() {
    selectedItemList.clear();
    notifyListeners();
  }
}

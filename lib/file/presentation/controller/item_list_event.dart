part of 'item_list_bloc.dart';

abstract class ItemListEvent extends Equatable {
  const ItemListEvent();

  @override
  List<Object> get props => [];
}

class GetItemList extends ItemListEvent {}

class UploadItem extends ItemListEvent {
  const UploadItem({required this.item});
  final Item item;
}

class SwitchFavoriteStatus extends ItemListEvent {
  const SwitchFavoriteStatus(this.item);
  final Item item;
}

class RenameItem extends ItemListEvent {
  const RenameItem({required this.item, required this.name});
  final Item item;
  final String name;
}

class RemoveItems extends ItemListEvent {
  const RemoveItems(this.removeItemList);
  final List<Item> removeItemList;
}

class RemoveSingleItem extends ItemListEvent {
  const RemoveSingleItem(this.removeItem);
  final Item removeItem;
}

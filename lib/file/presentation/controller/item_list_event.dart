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

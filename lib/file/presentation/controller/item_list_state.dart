part of 'item_list_bloc.dart';

abstract class ItemListState extends Equatable {
  @override
  List<Object> get props => [];
}

class ItemListInitial extends ItemListState {}

class ItemListLoadInProgress extends ItemListState {}

class ItemListLoadSuccess extends ItemListState {
  ItemListLoadSuccess(this.itemList);
  final List<Item> itemList;
  @override
  List<Object> get props => [itemList];
}

class ItemListLoadFailure extends ItemListState {}

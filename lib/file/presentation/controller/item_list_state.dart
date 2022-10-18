// ignore_for_file: must_be_immutable

part of 'item_list_bloc.dart';

abstract class ItemListState extends Equatable {
  late List<Item> itemList;
  @override
  List<Object> get props => itemList;
}

class ItemListInitial extends ItemListState {}

class ItemListLoadInProgress extends ItemListState {}

class ItemListLoadSuccess extends ItemListState {
  ItemListLoadSuccess(this.newItemList);
  final List<Item> newItemList;
  @override
  List<Item> get itemList => newItemList;
}

class ItemListLoadFailure extends ItemListState {}

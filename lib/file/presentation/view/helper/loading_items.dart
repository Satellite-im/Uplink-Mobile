import 'package:get_it/get_it.dart';
import 'package:uplink/file/domain/item.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';

Future<List<Item>> loadingItems() async {
  final _itemListBloc = GetIt.I.get<ItemListBloc>();
  return _itemListBloc.state.itemList;
}

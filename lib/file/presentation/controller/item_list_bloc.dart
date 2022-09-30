import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:uplink/file/data/repository/file_repository.dart';
import 'package:uplink/file/domain/item.dart';

part 'item_list_event.dart';
part 'item_list_state.dart';

class ItemListBloc extends Bloc<ItemListEvent, ItemListState> {
  ItemListBloc(this._fileRepository) : super(ItemListInitial()) {
    on<GetItemList>((event, emit) async {
      emit(ItemListLoadInProgress());
      try {
        final _itemList = await _fileRepository.getItemList();
        emit(ItemListLoadSuccess(_itemList));
      } catch (e) {
        addError('ItemListBloc -> GetItemList Error:$e');
        emit(ItemListLoadFailure());
      }
    });
  }
  final FileRepository _fileRepository;
}

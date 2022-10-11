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

    on<UploadItem>((event, emit) async {
      emit(ItemListLoadInProgress());
      try {
        await _fileRepository.uploadItem(event.item);
        final _itemList = await _fileRepository.getItemList();
        emit(ItemListLoadSuccess(_itemList));
      } catch (e) {
        addError('ItemListBloc -> UploadItem Error:$e');
        emit(ItemListLoadFailure());
      }
    });

    on<SwitchFavoriteStatus>(
      (event, emit) async {
        emit(ItemListLoadInProgress());
        try {
          await _fileRepository.switchFavoriteStatus(event.item);
          final _itemList = await _fileRepository.getItemList();
          emit(ItemListLoadSuccess(_itemList));
        } catch (e) {
          addError('ItemListBloc -> SwitchFavoriteStatus Error:$e');
          emit(ItemListLoadFailure());
        }
      },
    );

    on<RenameItem>(
      (event, emit) async {
        emit(ItemListLoadInProgress());
        try {
          await _fileRepository.renameItem(item: event.item, name: event.name);
          final _itemList = await _fileRepository.getItemList();
          emit(ItemListLoadSuccess(_itemList));
        } catch (e) {
          addError('ItemListBloc -> RenameItem Error:$e');
          emit(ItemListLoadFailure());
        }
      },
    );
    on<RemoveItems>(
      (event, emit) async {
        emit(ItemListLoadInProgress());
        try {
          await _fileRepository.removeItems(event.removeItemList);
          final _itemList = await _fileRepository.getItemList();
          emit(ItemListLoadSuccess(_itemList));
        } catch (e) {
          addError('ItemListBloc -> RemoveItems Error:$e');
          emit(ItemListLoadFailure());
        }
      },
    );
    on<RemoveSingleItem>(
      (event, emit) async {
        emit(ItemListLoadInProgress());
        try {
          await _fileRepository.removeSingleItem(event.removeItem);
          final _itemList = await _fileRepository.getItemList();
          emit(ItemListLoadSuccess(_itemList));
        } catch (e) {
          addError('ItemListBloc -> RemoveSingleItem Error:$e');
          emit(ItemListLoadFailure());
        }
      },
    );
  }
  final IFileRepository _fileRepository;
}

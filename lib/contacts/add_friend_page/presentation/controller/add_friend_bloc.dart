import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/add_friend_repository.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

part 'add_friend_event.dart';
part 'add_friend_state.dart';

class AddFriendBloc extends Bloc<AddFriendEvent, AddFriendState> {
  AddFriendBloc(this._addFriendRepository) : super(AddFriendInitial()) {
    on<SearchUser>((event, emit) async {
      try {
        emit(AddFriendLoading());
        user = null;
        user = await _addFriendRepository.findUserByDid(event.userDid);
        emit(AddFriendSuccess(user!));
      } catch (error) {
        addError(error);
        emit(AddFriendError());
      }
    });
  }

  User? user;

  final IAddFriendRepository _addFriendRepository;
}

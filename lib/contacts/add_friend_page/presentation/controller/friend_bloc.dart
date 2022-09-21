import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/add_friend_page/domain/friend_request.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc(this._friendRepository) : super(FriendInitial()) {
    on<SearchUserStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        user = null;
        user = await _friendRepository.findUserByDid(event.userDid);
        // TODO(Status): Change it when we have status from Warp
        user = user?.copywith(status: Status.online);
        emit(FriendLoadSuccess(user));
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<SendFriendRequestStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        _friendRepository.sendFriendRequest(user!.did!);
        emit(FriendLoadSuccess(user));
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<ListIncomingFriendRequestsStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        incomingFriendRequestsList =
            await _friendRepository.listIncomingFriendRequests();
        emit(FriendLoadSuccess());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });
  }

  User? user;

  List<FriendRequest> incomingFriendRequestsList = [];

  final IFriendRepository _friendRepository;
}

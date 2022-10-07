import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/domain/friend_request.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc(this._friendRepository) : super(FriendInitial()) {
    on<ResetFriendDataStarted>((event, emit) {
      friendsList.clear();
      user = null;
      incomingFriendRequestsList.clear();
      outgoingFriendRequestsList.clear();
      emit(FriendInitial());
    });

    on<SearchUserStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        if (event.userDid == _currentUserController.currentUser!.did) {
          emit(
            FriendLoadFailure(FriendLoadFailureTypes.yourselfSentFriendRequest),
          );
          return;
        }

        user = null;
        user = await _friendRepository.findUserByDid(event.userDid);
        // TODO(Status): Change it when we have status from Warp
        user = user?.copywith(status: Status.online);
        emit(FriendLoadSuccess(user));
      } catch (error) {
        emit(
          FriendLoadFailure(
            FriendLoadFailureTypesX.fromString(error.toString()),
          ),
        );
        addError(error);
      }
    });

    on<SendFriendRequestStarted>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        if (user?.relationship == Relationship.block) {
          add(UnblockUserStarted(user!));
        }
        _friendRepository.sendFriendRequest(user!.did!);
        emit(FriendLoadSuccess(user));
      } catch (error) {
        emit(
          FriendLoadFailure(
            FriendLoadFailureTypesX.fromString(error.toString()),
          ),
        );
        addError(error);
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

    on<ListOutgoingFriendRequestsStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        outgoingFriendRequestsList =
            await _friendRepository.listOutgoingFriendRequests();
        emit(FriendLoadSuccess());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<ListBlockedUsersStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        blockedUsersList = await _friendRepository.listBlockedUsers();
        emit(FriendLoadSuccess());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<FriendRequestAcceptanceStarted>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        _friendRepository.acceptFriendRequest(event.user.did!);
        add(ListIncomingFriendRequestsStarted());
        add(ListFriendsStarted());
        emit(FriendLoadSuccess());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<FriendRequestDenialStarted>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        _friendRepository.denyFriendRequest(event.user.did!);
        add(ListIncomingFriendRequestsStarted());
        emit(FriendLoadSuccess());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<CancelFriendRequestSent>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        _friendRepository.cancelFriendRequestSent(event.user.did!);
        add(ListOutgoingFriendRequestsStarted());
        emit(FriendLoadSuccess(user));
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<ListFriendsStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        friendsList = await _friendRepository.listFriends();
        emit(FriendLoadSuccess());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<BlockUserStarted>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        if (event.user.relationship == Relationship.friend) {
          add(RemoveFriend(event.user));
        }
        _friendRepository.blockUser(event.user.did!);
        add(ListBlockedUsersStarted());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<UnblockUserStarted>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        _friendRepository.unblockUser(event.user.did!);
        add(ListBlockedUsersStarted());
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<RemoveFriend>((event, emit) {
      try {
        emit(FriendLoadInProgress());
        _friendRepository.removeFriend(event.user.did!);
        emit(FriendLoadSuccess(user));
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });
  }

  User? user;

  List<FriendRequest> incomingFriendRequestsList = [];

  List<FriendRequest> outgoingFriendRequestsList = [];

  List<User> friendsList = [];

  List<User> blockedUsersList = [];

  final _currentUserController = GetIt.I.get<CurrentUserBloc>();

  final IFriendRepository _friendRepository;
}

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:ui_library/ui_library_export.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_repository.dart';
import 'package:uplink/shared/domain/entities/user.entity.dart';
import 'package:uplink/utils/services/warp/warp_multipass.dart';

part 'friend_event.dart';
part 'friend_state.dart';

class FriendBloc extends Bloc<FriendEvent, FriendState> {
  FriendBloc(this._friendRepository) : super(FriendInitial()) {
    on<SearchUserStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        user = null;
        user = await _friendRepository.findUserByDid(event.userDid);
        user = user?.copywith(status: Status.online);
        emit(FriendLoadSuccess(user!));
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });

    on<SendFriendRequestStarted>((event, emit) async {
      try {
        emit(FriendLoadInProgress());
        await _friendRepository.findUserByDid(user!.did!);
        _warpMultipass.sendFriendRequest(user!.did!);
        user = user?.copywith(status: Status.online);
        emit(FriendLoadSuccess(user!));
      } catch (error) {
        addError(error);
        emit(FriendLoadFailure());
      }
    });
  }

  User? user;

  final IFriendRepository _friendRepository;

  final _warpMultipass = GetIt.I.get<WarpMultipass>();
}

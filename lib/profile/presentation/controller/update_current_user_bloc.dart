import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uplink/profile/domain/usecases/update_current_user.usecase.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';

part 'update_current_user_event.dart';
part 'update_current_user_state.dart';

class UpdateCurrentUserBloc
    extends Bloc<UpdateCurrentUserEvent, UpdateCurrentUserState> {
  UpdateCurrentUserBloc(this._updateCurrentUserUseCase)
      : super(UpdateCurrentUserStateInitial()) {
    on<GetUsername>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        final _username = _updateCurrentUserUseCase.getUsername();
        currentUser = currentUser!.copywith(username: _username);
        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<GetMessageStatus>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        final _messageStatus = _updateCurrentUserUseCase.getMessageStatus();
        currentUser = currentUser!.copywith(statusMessage: _messageStatus);

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<UpdateUsername>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        final _newUsername = _updateCurrentUserUseCase.modifyUsername(
          newUsername: event.newUsername,
        );
        currentUser = currentUser!.copywith(username: _newUsername);

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<UpdateMessageStatus>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        final _newMessageStatus = _updateCurrentUserUseCase.modifyMessageStatus(
          newMessageStatus: event.newMessageStatus,
        );
        currentUser = currentUser!.copywith(statusMessage: _newMessageStatus);

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });
  }
  CurrentUser? currentUser;

  final UpdateCurrentUserUseCase _updateCurrentUserUseCase;
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:uplink/shared/domain/entities/current_user_profile.entity.dart';
import 'package:uplink/shared/domain/usecases/update_profile.usecase.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {
  CurrentUserBloc(this._updateProfileUseCase)
      : super(UpdateCurrentUserInitial()) {
    on<GetUsername>((event, emit) {
      try {
        emit(UpdateCurrentUserLoading());
        final _username = _updateProfileUseCase.getUsername();
        currentUserProfile = currentUserProfile!.copywith(username: _username);
        emit(UpdateCurrentUserSuccess(currentUserProfile!));
      } catch (error) {
        emit(UpdateCurrentUserError());
        addError(error);
      }
    });

    on<GetMessageStatus>((event, emit) {
      try {
        emit(UpdateCurrentUserLoading());
        final _messageStatus = _updateProfileUseCase.getMessageStatus();
        currentUserProfile =
            currentUserProfile!.copywith(statusMessage: _messageStatus);

        emit(UpdateCurrentUserSuccess(currentUserProfile!));
      } catch (error) {
        emit(UpdateCurrentUserError());
        addError(error);
      }
    });

    on<UpdateUsername>((event, emit) {
      try {
        emit(UpdateCurrentUserLoading());
        final _newUsername = _updateProfileUseCase.modifyUsername(
          newUsername: event.newUsername,
        );
        currentUserProfile =
            currentUserProfile!.copywith(username: _newUsername);

        emit(UpdateCurrentUserSuccess(currentUserProfile!));
      } catch (error) {
        emit(UpdateCurrentUserError());
        addError(error);
      }
    });

    on<UpdateMessageStatus>((event, emit) {
      try {
        emit(UpdateCurrentUserLoading());
        final _newMessageStatus = _updateProfileUseCase.modifyMessageStatus(
          newMessageStatus: event.newMessageStatus,
        );
        currentUserProfile =
            currentUserProfile!.copywith(statusMessage: _newMessageStatus);

        emit(UpdateCurrentUserSuccess(currentUserProfile!));
      } catch (error) {
        emit(UpdateCurrentUserError());
        addError(error);
      }
    });
  }
  CurrentUserProfile? currentUserProfile;

  final UpdateProfileUseCase _updateProfileUseCase;
}

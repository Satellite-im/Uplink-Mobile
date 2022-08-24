import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';

part 'update_current_user_event.dart';
part 'update_current_user_state.dart';

class UpdateCurrentUserBloc
    extends Bloc<UpdateCurrentUserEvent, UpdateCurrentUserState> {
  UpdateCurrentUserBloc(this._updateCurrentUserRepository)
      : super(UpdateCurrentUserStateInitial()) {
    on<GetAllUserInfo>((event, emit) async {
      try {
        emit(UpdateCurrentUserStateLoading());
        if (event.currentUser == null) {
          currentUser = await _updateCurrentUserRepository.getCurrentUserInfo();
        } else {
          currentUser = event.currentUser;
        }

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<GetDid>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        final _did = _updateCurrentUserRepository.getDid();
        currentUser = currentUser!.copywith(did: _did);
        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<GetUsername>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        final _username = _updateCurrentUserRepository.getUsername();
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
        final _messageStatus = _updateCurrentUserRepository.getMessageStatus();
        currentUser = currentUser!.copywith(statusMessage: _messageStatus);

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<GetProfilePicture>((event, emit) async {
      try {
        emit(UpdateCurrentUserStateLoading());
        File? _imageFile;
        final _base64Image = _updateCurrentUserRepository.getProfilePicture();
        if (_base64Image.isEmpty) {
          _imageFile = File('');
        } else {
          final _imageBytes = base64.decode(_base64Image);
          final _appTempDir = await path_provider.getTemporaryDirectory();
          final _fileToSaveImage = File(
            '${_appTempDir.path}/profile_picture_${DateTime.now().millisecondsSinceEpoch}.jpg',
          );
          _imageFile = await _fileToSaveImage.writeAsBytes(_imageBytes);
        }

        currentUser = currentUser!.copywith(
          profilePicture: (_imageFile.path.isEmpty) ? null : _imageFile,
        );

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<GetBannerPicture>((event, emit) async {
      try {
        emit(UpdateCurrentUserStateLoading());
        File? _imageFile;

        final _base64Image = _updateCurrentUserRepository.getBannerPicture();
        if (_base64Image.isEmpty) {
          _imageFile = File('');
        } else {
          final _imageBytes = base64.decode(_base64Image);
          final _appTempDir = await path_provider.getTemporaryDirectory();
          final _fileToSaveImage = File(
            '${_appTempDir.path}/banner_picture_${DateTime.now().millisecondsSinceEpoch}.jpg',
          );
          _imageFile = await _fileToSaveImage.writeAsBytes(_imageBytes);
        }

        currentUser = currentUser!.copywith(
          bannerPicture: (_imageFile.path.isEmpty) ? null : _imageFile,
        );

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<UpdateProfilePicture>((event, emit) async {
      try {
        emit(UpdateCurrentUserStateLoading());

        if (event.profilePicture.path.isEmpty) {
          _updateCurrentUserRepository.modifyProfilePicture('');
        } else {
          final _imageBytes = await event.profilePicture.readAsBytes();
          final _base64Image = base64Encode(_imageBytes);
          _updateCurrentUserRepository.modifyProfilePicture(_base64Image);
        }
        currentUser = currentUser!.copywith(
          profilePicture:
              event.profilePicture.path.isEmpty ? null : event.profilePicture,
        );

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error, StackTrace.current);
      }
    });

    on<UpdateBannerPicture>((event, emit) async {
      try {
        emit(UpdateCurrentUserStateLoading());

        if (event.bannerPicture.path.isEmpty) {
          _updateCurrentUserRepository.modifyBannerPicture('');
        } else {
          final _imageBytes = await event.bannerPicture.readAsBytes();
          final _base64Image = base64Encode(_imageBytes);
          _updateCurrentUserRepository.modifyBannerPicture(_base64Image);
        }

        currentUser = currentUser!.copywith(
          bannerPicture:
              event.bannerPicture.path.isEmpty ? null : event.bannerPicture,
        );

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error, StackTrace.current);
      }
    });

    on<UpdateUsername>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        _updateCurrentUserRepository.modifyUsername(
          event.newUsername,
        );

        currentUser = currentUser!.copywith(username: event.newUsername);

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });

    on<UpdateMessageStatus>((event, emit) {
      try {
        emit(UpdateCurrentUserStateLoading());
        _updateCurrentUserRepository.modifyMessageStatus(
          event.newMessageStatus,
        );
        currentUser = currentUser!.copywith(
          statusMessage: event.newMessageStatus,
        );

        emit(UpdateCurrentUserStateSuccess(currentUser!));
      } catch (error) {
        emit(UpdateCurrentUserStateError());
        addError(error);
      }
    });
  }
  CurrentUser? currentUser = const CurrentUser.newUser(username: '');

  final IUpdateCurrentUserRepository _updateCurrentUserRepository;
}

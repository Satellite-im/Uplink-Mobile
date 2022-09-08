import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:uplink/profile/data/repositories/user_profile.repository.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';

part 'current_user_event.dart';
part 'current_user_state.dart';

class CurrentUserBloc extends Bloc<CurrentUserEvent, CurrentUserState> {
  CurrentUserBloc(this._currentUserRepository) : super(CurrentUserInitial()) {
    on<GetCurrentUserInfo>((event, emit) async {
      try {
        emit(CurrentUserLoadInProgress());
        if (event.currentUser == null) {
          currentUser = await _currentUserRepository.getCurrentUserInfo();
        } else {
          currentUser = event.currentUser;
        }

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('GetCurrentUserInfo failed'));
        addError(error);
      }
    });

    on<GetDid>((event, emit) {
      try {
        emit(CurrentUserLoadInProgress());
        final _did = _currentUserRepository.getDid();
        currentUser = currentUser!.copywith(did: _did);
        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('GetDid failed'));
        addError(error);
      }
    });

    on<GetUsername>((event, emit) {
      try {
        emit(CurrentUserLoadInProgress());
        final _username = _currentUserRepository.getUsername();
        currentUser = currentUser!.copywith(username: _username);
        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('GetUsername failed'));
        addError(error);
      }
    });

    on<GetMessageStatus>((event, emit) {
      try {
        emit(CurrentUserLoadInProgress());
        final _messageStatus = _currentUserRepository.getMessageStatus();
        currentUser = currentUser!.copywith(statusMessage: _messageStatus);

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('GetMessageStatus failed'));
        addError(error);
      }
    });

    on<GetProfilePicture>((event, emit) async {
      try {
        emit(CurrentUserLoadInProgress());
        File? _imageFile;
        final _base64Image = _currentUserRepository.getProfilePicture();
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

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('GetProfilePicture failed'));
        addError(error);
      }
    });

    on<GetBannerPicture>((event, emit) async {
      try {
        emit(CurrentUserLoadInProgress());
        File? _imageFile;

        final _base64Image = _currentUserRepository.getBannerPicture();
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

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('GetBannerPicture failed'));
        addError(error);
      }
    });

    on<UpdateProfilePicture>((event, emit) async {
      try {
        emit(CurrentUserLoadInProgress());

        if (event.profilePicture.path.isEmpty) {
          _currentUserRepository.modifyProfilePicture('');
        } else {
          final _imageBytes = await event.profilePicture.readAsBytes();
          final _base64Image = base64Encode(_imageBytes);
          _currentUserRepository.modifyProfilePicture(_base64Image);
        }
        currentUser = currentUser!.copywith(
          profilePicture:
              event.profilePicture.path.isEmpty ? null : event.profilePicture,
        );

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('UpdateProfilePicture failed'));
        addError(error, StackTrace.current);
      }
    });

    on<UpdateBannerPicture>((event, emit) async {
      try {
        emit(CurrentUserLoadInProgress());

        if (event.bannerPicture.path.isEmpty) {
          _currentUserRepository.modifyBannerPicture('');
        } else {
          final _imageBytes = await event.bannerPicture.readAsBytes();
          final _base64Image = base64Encode(_imageBytes);
          _currentUserRepository.modifyBannerPicture(_base64Image);
        }

        currentUser = currentUser!.copywith(
          bannerPicture:
              event.bannerPicture.path.isEmpty ? null : event.bannerPicture,
        );

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('UpdateBannerPicture failed'));
        addError(error, StackTrace.current);
      }
    });

    on<UpdateUsername>((event, emit) {
      try {
        emit(CurrentUserLoadInProgress());
        _currentUserRepository.modifyUsername(
          event.newUsername,
        );

        currentUser = currentUser!.copywith(username: event.newUsername);

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('UpdateUsername failed'));
        addError(error);
      }
    });

    on<UpdateMessageStatus>((event, emit) {
      try {
        emit(CurrentUserLoadInProgress());
        _currentUserRepository.modifyMessageStatus(
          event.newMessageStatus,
        );
        currentUser = currentUser!.copywith(
          statusMessage: event.newMessageStatus,
        );

        emit(CurrentUserLoadSuccess(currentUser!));
      } catch (error) {
        emit(CurrentUserLoadFailure('UpdateMessageStatus failed'));
        addError(error);
      }
    });
  }
  CurrentUser? currentUser = const CurrentUser.newUser(username: '');

  final IUserProfileRepository _currentUserRepository;
}

import 'package:uplink/profile/data/repositories/update_profile.repository.dart';
import 'package:uplink/profile/domain/entities/current_user_profile.entity.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._repository);

  final IUpdateProfileRepository _repository;

  CurrentUserProfile getUsername({
    required CurrentUserProfile currentUser,
  }) {
    final _newUsername = _repository.getUsername();
    return currentUser.copywith(username: _newUsername);
  }

  CurrentUserProfile getMessageStatus({
    required CurrentUserProfile currentUser,
  }) {
    final _newMessageStatus = _repository.getMessageStatus();
    return currentUser.copywith(statusMessage: _newMessageStatus);
  }

  CurrentUserProfile modifyMessageStatus({
    required CurrentUserProfile currentUser,
  }) {
    if (currentUser.statusMessage != null &&
        currentUser.statusMessage!.isNotEmpty) {
      _repository.modifyMessageStatus(currentUser.statusMessage!);
      return getUsername(currentUser: currentUser);
    } else {
      return currentUser;
    }
  }

  CurrentUserProfile modifyUsername({
    required CurrentUserProfile currentUser,
  }) {
    if (currentUser.username.isNotEmpty) {
      _repository.modifyMessageStatus(currentUser.username);
      return getMessageStatus(currentUser: currentUser);
    } else {
      return currentUser;
    }
  }
}

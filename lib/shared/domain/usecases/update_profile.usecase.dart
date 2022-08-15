import 'package:uplink/shared/data/repositories/update_profile.repository.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._repository);

  final IUpdateProfileRepository _repository;

  String getUsername() {
    final _username = _repository.getUsername();
    return _username;
  }

  String getMessageStatus() {
    final _messageStatus = _repository.getMessageStatus();
    return _messageStatus;
  }

  String modifyMessageStatus({
    required String newMessageStatus,
  }) {
    _repository.modifyMessageStatus(newMessageStatus);
    return getMessageStatus();
  }

  String modifyUsername({
    required String newUsername,
  }) {
    _repository.modifyUsername(newUsername);
    return getUsername();
  }
}

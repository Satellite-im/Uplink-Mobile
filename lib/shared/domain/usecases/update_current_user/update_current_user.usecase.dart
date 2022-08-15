import 'package:uplink/shared/data/repositories/update_current_user/update_current_user.repository.dart';

class UpdateCurrentUserUseCase {
  const UpdateCurrentUserUseCase(this._repository);

  final IUpdateCurrentUserRepository _repository;

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

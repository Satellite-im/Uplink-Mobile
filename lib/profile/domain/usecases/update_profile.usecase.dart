import 'package:uplink/profile/data/repositories/update_profile.repository.dart';
import 'package:uplink/profile/domain/entities/profile.entity.dart';

class UpdateProfileUseCase {
  const UpdateProfileUseCase(this._repository);

  final IUpdateProfileRepository _repository;

  Future<CurrentUserProfile> getUsername({
    required CurrentUserProfile currentUser,
  }) async {
    final _newUsername = await _repository.getUsername();
    return currentUser.copywith(username: _newUsername);
  }
}

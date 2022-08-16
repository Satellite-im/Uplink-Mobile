import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';

class CreateCurrentUserUseCase {
  const CreateCurrentUserUseCase(this._repository);

  final IAuthenticationRepository _repository;

  Future<CurrentUser> createCurrentUser({
    required CurrentUser newUser,
    required String password,
  }) async =>
      _repository.createCurrentUser(
        newUser: newUser,
        password: password,
      );
}

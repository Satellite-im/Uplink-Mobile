import 'package:bloc_test/bloc_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';

class MockIAuthenticationRepository extends Mock
    implements IAuthenticationRepository {}

class MockCurrentUserEvent extends Mock implements CurrentUserEvent {}

class MockCurrentUserBloc extends MockBloc<CurrentUserEvent, CurrentUserState>
    implements CurrentUserBloc {}

class MockCurrentUser extends Mock implements CurrentUser {}

void registerDependencies() {
  GetIt.I.registerLazySingleton<CurrentUserBloc>(
    MockCurrentUserBloc.new,
  );
}

import 'package:get_it/get_it.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/auth/data/datasource/create_current_user.remote_datasource.dart';
import 'package:uplink/auth/data/datasource/store_auth_keys.local_datasource.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/auth/data/repositories/authentication_impl.repository.dart';
import 'package:uplink/auth/domain/usecases/create_current_user.usecase.dart';
import 'package:uplink/auth/domain/usecases/store_auth_keys.usecase.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/profile/data/datasource/update_current_user.remote_datasource.dart';
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';
import 'package:uplink/profile/data/repositories/update_current_user_impl.repository.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/utils/services/services_export.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/services/warp/warp_service.dart';

void main() {
  _registerDependencies();
  bootstrap(() => const App());
}

void _registerDependencies() {
  final _getIt = GetIt.I;

  _registerDependencieToEnableWarp(_getIt);
  _registerDependenciesToAuth(_getIt);
  _registerDependencieToUpdateCurrentUser(_getIt);
}

void _registerDependencieToEnableWarp(GetIt _getIt) {
  _getIt.registerLazySingleton<WarpBloc>(
    WarpBloc.new,
  );
}

void _registerDependenciesToAuth(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRepositoryImpl(
        _getIt(),
        _getIt(),
      ),
    )
    ..registerLazySingleton<CreateCurrentUserData>(
      () => CreateCurrentUserData(
        Warp(),
      ),
    )
    ..registerLazySingleton<StoreAuthKeysData>(
      () => StoreAuthKeysData(
        ULocalStorageService(),
      ),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        CreateCurrentUserUseCase(
          _getIt(),
        ),
        StoreAuthKeysUseCase(
          _getIt(),
        ),
      ),
    );
}

void _registerDependencieToUpdateCurrentUser(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IUpdateCurrentUserRepository>(
      () => UpdateCurrentUserRepositoryImpl(_getIt()),
    )
    ..registerLazySingleton<UpdateCurrentUserData>(
      () => UpdateCurrentUserData(
        Warp(),
      ),
    )
    ..registerLazySingleton<UpdateCurrentUserBloc>(
      () => UpdateCurrentUserBloc(
        _getIt(),
      ),
    );
}

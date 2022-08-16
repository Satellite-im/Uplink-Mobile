import 'package:get_it/get_it.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/profile/data/datasource/update_current_user.datasource.dart';
import 'package:uplink/profile/data/repositories/update_current_user.repository.dart';
import 'package:uplink/profile/data/repositories/update_current_user_impl.repository.dart';
import 'package:uplink/profile/domain/usecases/update_current_user.usecase.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/services/warp/warp_service.dart';

void main() {
  _registerDependencies();
  bootstrap(() => const App());
}

void _registerDependencies() {
  final _getIt = GetIt.I;

  _registerDependencieToEnableWarp(_getIt);
  _registerDependencieToUpdateCurrentUser(_getIt);
}

void _registerDependencieToEnableWarp(GetIt _getIt) {
  _getIt.registerLazySingleton<WarpBloc>(
    WarpBloc.new,
  );
}

void _registerDependencieToUpdateCurrentUser(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IUpdateCurrentUserRepository>(
      () => UpdateCurrentUserRepositoryImpl(_getIt()),
    )
    ..registerLazySingleton<UpdateCurrentUserDataWarp>(
      () => UpdateCurrentUserDataWarp(
        Warp(),
      ),
    )
    ..registerLazySingleton<UpdateCurrentUserBloc>(
      () => UpdateCurrentUserBloc(
        UpdateCurrentUserUseCase(
          _getIt(),
        ),
      ),
    );
}

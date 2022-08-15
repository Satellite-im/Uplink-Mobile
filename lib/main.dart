import 'package:get_it/get_it.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/shared/controller/update_current_user/update_current_user_bloc.dart';
import 'package:uplink/shared/data/datasource/update_current_user/update_current_user.datasource.dart';
import 'package:uplink/shared/data/repositories/update_current_user/update_current_user.repository.dart';
import 'package:uplink/shared/data/repositories/update_current_user/update_current_user_impl.repository.dart';
import 'package:uplink/shared/domain/usecases/update_current_user/update_current_user.usecase.dart';
import 'package:uplink/utils/services/warp.dart';

void main() {
  _registerDependencies();
  bootstrap(() => const App());
}

void _registerDependencies() {
  final getIt = GetIt.I;

  getIt
    ..registerLazySingleton<IUpdateCurrentUserRepository>(
      () => UpdateCurrentUserRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<UpdateCurrentUserDataWarp>(
      () => UpdateCurrentUserDataWarp(
        Warp(),
      ),
    )
    ..registerLazySingleton<UpdateCurrentUserBloc>(
      () => UpdateCurrentUserBloc(
        UpdateCurrentUserUseCase(
          getIt(),
        ),
      ),
    );
}

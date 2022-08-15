import 'package:get_it/get_it.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/shared/controller/current_user/profile_bloc.dart';
import 'package:uplink/shared/data/datasource/update_profile.datasource.dart';
import 'package:uplink/shared/data/repositories/update_profile.repository.dart';
import 'package:uplink/shared/data/repositories/update_profile_impl.repository.dart';
import 'package:uplink/shared/domain/usecases/update_profile.usecase.dart';
import 'package:uplink/utils/warp/warp.dart';

void main() {
  _registerDependencies();
  bootstrap(() => const App());
}

void _registerDependencies() {
  final getIt = GetIt.I;

  getIt
    ..registerLazySingleton<IUpdateProfileRepository>(
      () => UpdateProfileRepositoryImpl(getIt()),
    )
    ..registerLazySingleton<UpdateProfileDataWarp>(
      () => UpdateProfileDataWarp(
        Warp(),
      ),
    )
    ..registerLazySingleton<CurrentUserBloc>(
      () => CurrentUserBloc(
        UpdateProfileUseCase(
          getIt(),
        ),
      ),
    );
}

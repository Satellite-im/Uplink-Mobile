import 'package:get_it/get_it.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/auth/data/datasource/auth_local_data.local_datasource.dart';
import 'package:uplink/auth/data/datasource/warp_current_user_data.remote_datasource.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/auth/data/repositories/authentication_impl.repository.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/contacts/add_friend_page/data/datasource/friend.remote_datasource.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_impl.repository.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/profile/data/datasource/user_profile_data.remote_datasource.dart';
import 'package:uplink/profile/data/repositories/user_profile.repository.dart';
import 'package:uplink/profile/data/repositories/user_profile_impl.repository.dart';
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
  _registerDependencieFriend(_getIt);
}

void _registerDependencieToEnableWarp(GetIt _getIt) {
  _getIt.registerLazySingleton<WarpBloc>(
    WarpBloc.new,
  );
}

void _registerDependencieFriend(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IFriendRepository>(
      () => FriendRepositoryImpl(
        _getIt(),
      ),
    )
    ..registerLazySingleton<FriendData>(
      () => FriendData(
        WarpMultipass(),
      ),
    )
    ..registerLazySingleton<FriendBloc>(
      () => FriendBloc(
        _getIt(),
      ),
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
    ..registerLazySingleton<WarpCurrentUserData>(
      () => WarpCurrentUserData(
        WarpMultipass(),
      ),
    )
    ..registerLazySingleton<AuthLocalData>(
      () => AuthLocalData(
        ULocalStorageService(),
      ),
    )
    ..registerLazySingleton<AuthBloc>(
      () => AuthBloc(
        _getIt(),
      ),
    );
}

void _registerDependencieToUpdateCurrentUser(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IUserProfileRepository>(
      () => UserProfileRepositoryImpl(
        _getIt(),
      ),
    )
    ..registerLazySingleton<UserProfileData>(
      () => UserProfileData(
        WarpMultipass(),
      ),
    )
    ..registerLazySingleton<UpdateCurrentUserBloc>(
      () => UpdateCurrentUserBloc(
        _getIt(),
      ),
    );
}

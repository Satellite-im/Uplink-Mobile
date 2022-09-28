import 'package:get_it/get_it.dart';
import 'package:uplink/app/app.dart';
import 'package:uplink/auth/data/datasource/auth_local_data.local_datasource.dart';
import 'package:uplink/auth/data/datasource/warp_current_user_data.remote_datasource.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/auth/data/repositories/authentication_impl.repository.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/bootstrap.dart';
import 'package:uplink/chat/data/datasource/chat.remote_datasource.dart';
import 'package:uplink/chat/data/repositories/chat.repository.dart';
import 'package:uplink/chat/data/repositories/chat_impl.repository.dart';
import 'package:uplink/chat/presentation/controller/chat_bloc.dart';
import 'package:uplink/contacts/add_friend_page/data/datasource/friend.remote_datasource.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_impl.repository.dart';
import 'package:uplink/contacts/add_friend_page/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/add_friend_page/presentation/controller/friend_bloc.dart';
import 'package:uplink/file/data/data_export.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/profile/data/datasource/user_profile_data.remote_datasource.dart';
import 'package:uplink/profile/data/repositories/user_profile.repository.dart';
import 'package:uplink/profile/data/repositories/user_profile_impl.repository.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/utils/services/services_export.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/services/warp/warp_multipass.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

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
  _registerDependencieChat(_getIt);
  _registerDependencieFile(_getIt);
}

void _registerDependencieToEnableWarp(GetIt _getIt) {
  _getIt.registerLazySingleton<WarpBloc>(
    WarpBloc.new,
  );
}

void _registerDependencieChat(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IChatRepository>(
      () => ChatRepositoryImpl(
        _getIt(),
      ),
    )
    ..registerLazySingleton<ChatData>(
      () => ChatData(
        WarpRaygun(),
      ),
    )
    ..registerLazySingleton<ChatBloc>(
      () => ChatBloc(
        _getIt(),
      ),
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
    ..registerLazySingleton<CurrentUserBloc>(
      () => CurrentUserBloc(
        _getIt(),
      ),
    );
}

void _registerDependencieFile(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<FileRepository>(
      () => FileRepository(
        _getIt(),
      ),
    )
    ..registerLazySingleton<FileApi>(MockFileApi.new)
    ..registerLazySingleton<ItemListBloc>(
      () => ItemListBloc(
        _getIt(),
      ),
    );
}

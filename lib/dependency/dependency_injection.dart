import 'package:get_it/get_it.dart';
import 'package:uplink/auth/data/datasource/auth_local_data.local_datasource.dart';
import 'package:uplink/auth/data/datasource/warp_current_user_data.remote_datasource.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/auth/data/repositories/authentication_impl.repository.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/chat/data/datasource/chat.remote_datasource.dart';
import 'package:uplink/chat/data/repositories/chat.repository.dart';
import 'package:uplink/chat/data/repositories/chat_impl.repository.dart';
import 'package:uplink/chat/presentation/controller/chat_bloc.dart';
import 'package:uplink/contacts/data/datasource/friend.remote_datasource.dart';
import 'package:uplink/contacts/data/repositories/friend_impl.repository.dart';
import 'package:uplink/contacts/data/repositories/friend_repository.dart';
import 'package:uplink/contacts/presentation/controller/friend_bloc.dart';
import 'package:uplink/contacts/presentation/view/contacts_index_page/helpers/contacts_list_stream.dart';
import 'package:uplink/file/data/data_export.dart';
import 'package:uplink/file/data/datasource/file.remote_datasource.dart';
import 'package:uplink/file/data/repository/file_impl_repository.dart';
import 'package:uplink/file/presentation/controller/item_list_bloc.dart';
import 'package:uplink/profile/data/datasource/user_profile_data.remote_datasource.dart';
import 'package:uplink/profile/data/repositories/user_profile.repository.dart';
import 'package:uplink/profile/data/repositories/user_profile_impl.repository.dart';
import 'package:uplink/profile/presentation/controller/current_user_bloc.dart';
import 'package:uplink/utils/services/services_export.dart';
import 'package:uplink/utils/services/warp/controller/warp_bloc.dart';
import 'package:uplink/utils/services/warp/warp_constellation.dart';
import 'package:uplink/utils/services/warp/warp_multipass.dart';
import 'package:uplink/utils/services/warp/warp_raygun.dart';

void registerDependencies() {
  final _getIt = GetIt.I;

  _registerDependenciesToEnableWarp(_getIt);
  _registerDependenciesToAuth(_getIt);
  _registerDependenciesToUpdateCurrentUser(_getIt);
  _registerDependenciesFriend(_getIt);
  _registerDependenciesChat(_getIt);
  _registerDependenciesFile(_getIt);
}

void _registerDependenciesToEnableWarp(GetIt _getIt) {
  _getIt.registerLazySingleton<WarpBloc>(
    WarpBloc.new,
  );
}

void _registerDependenciesChat(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IChatRepository>(
      () => ChatRepositoryImpl(
        _getIt(),
      ),
    )
    ..registerLazySingleton<ChatData>(
      () => ChatData(
        WarpRaygun(),
        WarpRaygunEventStream(),
      ),
    )
    ..registerLazySingleton<ChatBloc>(
      () => ChatBloc(
        _getIt(),
      ),
    );
}

void _registerDependenciesFriend(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IFriendRepository>(
      () => FriendRepositoryImpl(
        _getIt(),
      ),
    )
    ..registerLazySingleton<FriendData>(
      () => FriendData(
        WarpMultipass(),
        WarpMultipassEventStream(),
      ),
    )
    ..registerLazySingleton<FriendBloc>(
      () => FriendBloc(
        _getIt(),
      ),
    )
    ..registerLazySingleton<ContactsListStream>(
      () => ContactsListStream(
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

void _registerDependenciesToUpdateCurrentUser(GetIt _getIt) {
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

void _registerDependenciesFile(GetIt _getIt) {
  _getIt
    ..registerLazySingleton<IFileRepository>(
      () => FileRepositoryImpl(
        _getIt(),
      ),
    )
    ..registerLazySingleton<IFileDatasource>(
      () => FileData(
        WarpConstellation(),
      ),
    )
    ..registerLazySingleton<ItemListBloc>(
      () => ItemListBloc(
        _getIt(),
      ),
    );
}

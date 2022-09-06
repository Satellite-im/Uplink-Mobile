// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:uplink/auth/data/repositories/authentication.repository.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/services/services_export.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._repository,
  ) : super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      try {
        emit(AuthLoadInProgress());
        final _currentUser = await _repository.createCurrentUser(
          newUser: event.currentUser,
          password: event.password,
        );
        _updateCurrentUserController.add(
          GetCurrentUserInfo(currentUser: _currentUser),
        );

        emit(AuthLoadSuccess());
      } catch (error) {
        emit(AuthLoadFailure(message: 'Failed to create current user'));
      }
    });

    on<AuthSetPinData>((event, emit) async {
      try {
        await _repository.savePinValue(
          pinValue: pinValue!,
          storePin: storePin,
        );

        await _repository.saveUserIsLoggedValue();
      } catch (error) {
        emit(AuthLoadFailure(message: 'Failed to set local pin data'));
      }
    });

    on<AuthGetPinData>((event, emit) async {
      try {
        emit(GetAuthKeysLoading());

        final _pinValuesMap = await _repository.getPinValue();
        final _isUserLoggedValue = await _repository.getUserIsLoggedValue();

        final _pinValue = _pinValuesMap[ULocalKey.pinValue] == null
            ? null
            : _pinValuesMap[ULocalKey.pinValue] as String;
        final _isPinStored = _pinValuesMap[ULocalKey.isPinStored] == null
            ? false
            : _pinValuesMap[ULocalKey.isPinStored] as bool;

        final _authKeysMap = {
          ULocalKey.pinValue: _pinValue,
          ULocalKey.isPinStored: _isPinStored,
          ULocalKey.isUserLogged: _isUserLoggedValue,
        };

        emit(GetAuthKeysSuccess(_authKeysMap));
      } catch (error) {
        emit(AuthLoadFailure(message: 'Failed to get local pin data'));
      }
    });
  }

  String? pinValue;
  bool storePin = false;

  final _updateCurrentUserController = GetIt.I.get<CurrentUserBloc>();
  final IAuthenticationRepository _repository;
}

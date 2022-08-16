// ignore_for_file: avoid_bool_literals_in_conditional_expressions

import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';
import 'package:uplink/auth/domain/usecases/create_current_user.usecase.dart';
import 'package:uplink/auth/domain/usecases/store_auth_keys.usecase.dart';
import 'package:uplink/profile/presentation/controller/update_current_user_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/services/services_export.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(
    this._createCurrentUserUseCase,
    this._storeAuthKeysUseCase,
  ) : super(AuthInitial()) {
    on<CreateNewCurrentUser>((event, emit) async {
      try {
        emit(AuthLoading());
        final _currentUser = await _createCurrentUserUseCase.createCurrentUser(
          newUser: event.currentUser,
          password: event.password,
        );
        _updateCurrentUserController.currentUser = _currentUser;
        emit(AuthSuccess());
      } catch (error) {
        emit(AuthError());
      }
    });

    on<SaveAuthKeys>((event, emit) async {
      try {
        if (savePin) {
          await _storeAuthKeysUseCase.savePinValue(
            pinValue: pinValue!,
          );
        }

        await _storeAuthKeysUseCase.saveIsUserLoggedValue();
      } catch (error) {
        emit(SaveAuthKeysError());
      }
    });

    on<GetAuthKeys>((event, emit) async {
      try {
        emit(GetAuthKeysLoading());

        final _pinValuesMap = await _storeAuthKeysUseCase.getPinValue();
        final _isUserLoggedValue =
            await _storeAuthKeysUseCase.getIsUserLoggedValue();

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
        emit(GetAuthKeysError());
      }
    });
  }

  String? pinValue;
  bool savePin = false;

  final _updateCurrentUserController = GetIt.I.get<UpdateCurrentUserBloc>();
  final CreateCurrentUserUseCase _createCurrentUserUseCase;
  final StoreAuthKeysUseCase _storeAuthKeysUseCase;
}

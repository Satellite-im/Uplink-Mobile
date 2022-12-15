import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:uplink/auth/presentation/controller/auth_bloc.dart';
import 'package:uplink/shared/domain/entities/current_user.entity.dart';
import 'package:uplink/utils/utils_export.dart';

import '../../../mock/dependency.dart';

void main() {
  const currentUser = CurrentUser(did: 'did', username: 'username');
  final mockIAuthenticationRepository = MockIAuthenticationRepository();
  final mockCurrentUserBloc = MockCurrentUserBloc();

  setUpAll(() {
    registerDependencies();
    registerFallbackValue(MockCurrentUser());
    registerFallbackValue(MockCurrentUserEvent());
  });

  group('auth bloc test', () {
    blocTest<AuthBloc, AuthState>(
      'Should_AuthenticateUser_'
      'When_AuthSignUp_Added',
      build: () {
        when(
          () => mockIAuthenticationRepository.createCurrentUser(
            newUser: any(named: 'newUser'),
            passphrase: any(named: 'passphrase'),
          ),
        ).thenAnswer((_) async => currentUser);
        when(
          () => mockCurrentUserBloc.add(any()),
        ).thenAnswer((_) {});

        return AuthBloc(mockIAuthenticationRepository);
      },
      act: (bloc) => bloc
          .add(AuthSignUp(currentUser: currentUser, passphrase: 'passphrase')),
      expect: () => [
        AuthLoadInProgress(),
        AuthLoadSuccess(),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_AuthLoadFailure_'
      'When_AuthSignUp_Added',
      build: () {
        when(
          () => mockIAuthenticationRepository.createCurrentUser(
            newUser: any(named: 'newUser'),
            passphrase: any(named: 'passphrase'),
          ),
        ).thenThrow('Failed to create current user');
        when(
          () => mockCurrentUserBloc.add(any()),
        ).thenAnswer((_) {});

        return AuthBloc(mockIAuthenticationRepository);
      },
      act: (bloc) => bloc
          .add(AuthSignUp(currentUser: currentUser, passphrase: 'passphrase')),
      expect: () => [
        AuthLoadInProgress(),
        AuthLoadFailure(message: 'Failed to create current user'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_AuthSetPinData_'
      'When_AuthSetPinData_Added',
      build: () {
        when(
          () => mockIAuthenticationRepository.savePinValue(
            pinValue: any(named: 'pinValue'),
            storePin: any(named: 'storePin'),
          ),
        ).thenAnswer((_) async {});
        when(
          mockIAuthenticationRepository.saveUserIsLoggedValue,
        ).thenAnswer((_) async {});

        final authBloc = AuthBloc(mockIAuthenticationRepository)
          ..pinValue = 'test';

        return authBloc;
      },
      act: (bloc) => bloc.add(AuthSetPinData()),
      expect: () => <AuthState>[],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_FailedToSetLocalPinData_'
      'When_AuthSetPinData_Added',
      build: () {
        when(
          () => mockIAuthenticationRepository.savePinValue(
            pinValue: any(named: 'pinValue'),
            storePin: any(named: 'storePin'),
          ),
        ).thenThrow('Something went wrong');
        when(
          mockIAuthenticationRepository.saveUserIsLoggedValue,
        ).thenAnswer((_) async {});

        final authBloc = AuthBloc(mockIAuthenticationRepository)
          ..pinValue = 'test';

        return authBloc;
      },
      act: (bloc) => bloc.add(AuthSetPinData()),
      expect: () => [
        AuthLoadFailure(message: 'Failed to set local pin data'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_GetPinData_'
      'When_AuthGetPinData_Added',
      build: () {
        when(
          mockIAuthenticationRepository.getPinValue,
        ).thenAnswer(
          (_) async => <ULocalKey, dynamic>{
            ULocalKey.pinValue: 'test',
            ULocalKey.isPinStored: false,
          },
        );
        when(
          mockIAuthenticationRepository.getUserIsLoggedValue,
        ).thenAnswer((_) async => true);

        return AuthBloc(mockIAuthenticationRepository);
      },
      act: (bloc) => bloc.add(AuthGetPinData()),
      expect: () => [
        AuthKeysLoadInProgress(),
        AuthKeysLoadSuccess(
          const <ULocalKey, dynamic>{
            ULocalKey.pinValue: 'test',
            ULocalKey.isPinStored: false,
            ULocalKey.isUserLogged: true,
          },
        ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_FailedToGetPinData_'
      'When_AuthGetPinData_Added',
      build: () {
        when(
          mockIAuthenticationRepository.getPinValue,
        ).thenThrow('Failed to get local pin data');
        when(
          mockIAuthenticationRepository.getUserIsLoggedValue,
        ).thenAnswer((_) async => true);

        return AuthBloc(mockIAuthenticationRepository);
      },
      act: (bloc) => bloc.add(AuthGetPinData()),
      expect: () => [
        AuthKeysLoadInProgress(),
        AuthLoadFailure(message: 'Failed to get local pin data'),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_LogoutAuthenticateUser_'
      'When_AuthLogout_Added',
      build: () {
        when(
          mockIAuthenticationRepository.deletePinValue,
        ).thenAnswer((_) async {});

        return AuthBloc(mockIAuthenticationRepository);
      },
      act: (bloc) => bloc.add(AuthLogout()),
      expect: () => [
        AuthKeysLoadInProgress(),
        AuthKeysLoadSuccess(
          const <ULocalKey, dynamic>{
            ULocalKey.pinValue: null,
            ULocalKey.isPinStored: false,
            ULocalKey.isUserLogged: false,
          },
        ),
      ],
    );

    blocTest<AuthBloc, AuthState>(
      'Should_FailedToLogoutAuthenticateUser_'
      'When_AuthLogout_Added',
      build: () {
        when(
          mockIAuthenticationRepository.deletePinValue,
        ).thenThrow('Failed to get local pin data');

        return AuthBloc(mockIAuthenticationRepository);
      },
      act: (bloc) => bloc.add(AuthLogout()),
      expect: () => [
        AuthKeysLoadInProgress(),
        AuthLoadFailure(message: 'Failed to get local pin data'),
      ],
    );
  });
}

part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthSignUp extends AuthEvent {
  AuthSignUp({
    required this.currentUser,
    required this.passphrase,
  });
  final CurrentUser currentUser;
  final String passphrase;
  @override
  List<Object> get props => [currentUser, passphrase];
}

class AuthSetPinData extends AuthEvent {}

class AuthGetPinData extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthEvent {}

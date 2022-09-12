part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthSignUp extends AuthEvent {
  // TODO(passphrase): All the passphrase are null right now
  AuthSignUp({
    required this.currentUser,
  }) : passphrase = null;
  final CurrentUser currentUser;
  final String? passphrase;
  @override
  List<Object> get props => [currentUser];
}

class AuthSetPinData extends AuthEvent {}

class AuthGetPinData extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthEvent {}

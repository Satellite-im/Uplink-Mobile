part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthSignUp extends AuthEvent {
  // TODO(password): All the password are null right now
  AuthSignUp({
    required this.currentUser,
  }) : password = null;
  final CurrentUser currentUser;
  final String? password;
  @override
  List<Object> get props => [currentUser];
}

class AuthSetPinData extends AuthEvent {}

class AuthGetPinData extends AuthEvent {
  @override
  List<Object> get props => [];
}

class AuthLogout extends AuthEvent {}

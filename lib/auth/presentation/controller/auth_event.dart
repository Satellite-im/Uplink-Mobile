part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  List<Object> get props => [];
}

class AuthStarted extends AuthEvent {}

class AuthCreateCurrentUser extends AuthEvent {
  // TODO(password): For now the password is empty because it is not working
  AuthCreateCurrentUser({
    required this.currentUser,
  }) : password = '';
  final CurrentUser currentUser;
  final String password;
  @override
  List<Object> get props => [currentUser, password];
}

class AuthSetPinData extends AuthEvent {}

class AuthGetPinData extends AuthEvent {
  @override
  List<Object> get props => [];
}

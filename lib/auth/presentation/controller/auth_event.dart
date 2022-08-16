part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {
  List<Object> get props => [];
}

class CreateNewCurrentUser extends AuthEvent {
  // TODO(password): For now the password is empty because it is not working
  CreateNewCurrentUser({
    required this.currentUser,
  }) : password = '';
  final CurrentUser currentUser;
  final String password;
  @override
  List<Object> get props => [currentUser, password];
}

class SaveAuthKeys extends AuthEvent {}

class GetAuthKeys extends AuthEvent {
  @override
  List<Object> get props => [];
}

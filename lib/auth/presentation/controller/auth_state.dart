part of 'auth_bloc.dart';

@immutable
abstract class AuthState {
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadInProgress extends AuthState {}

class AuthLoadSuccess extends AuthState {}

class AuthLoadFailure extends AuthState {
  AuthLoadFailure({required this.message});
  final String message;
}

// class SaveAuthKeysError extends AuthState {}

class GetAuthKeysLoading extends AuthState {}

class GetAuthKeysSuccess extends AuthState {
  GetAuthKeysSuccess(this.authKeysMap);

  final Map<ULocalKey, dynamic> authKeysMap;

  @override
  List<Object> get props => [authKeysMap];
}

// class GetAuthKeysError extends AuthState {}

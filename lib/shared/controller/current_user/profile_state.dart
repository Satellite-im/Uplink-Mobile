part of 'profile_bloc.dart';

@immutable
abstract class CurrentUserState {
  List<Object> get props => [];
}

class UpdateCurrentUserInitial extends CurrentUserState {}

class UpdateCurrentUserLoading extends CurrentUserState {}

class UpdateCurrentUserSuccess extends CurrentUserState {
  UpdateCurrentUserSuccess(this.currentUserProfile);

  final CurrentUserProfile currentUserProfile;

  @override
  List<Object> get props => [currentUserProfile];
}

class UpdateCurrentUserError extends CurrentUserState {}

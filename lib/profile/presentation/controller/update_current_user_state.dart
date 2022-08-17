part of 'update_current_user_bloc.dart';

@immutable
abstract class UpdateCurrentUserState {
  List<Object> get props => [];
}

class UpdateCurrentUserStateInitial extends UpdateCurrentUserState {}

class UpdateCurrentUserStateLoading extends UpdateCurrentUserState {}

class UpdateCurrentUserStateSuccess extends UpdateCurrentUserState {
  UpdateCurrentUserStateSuccess(this.currentUser);

  final CurrentUser currentUser;

  @override
  List<Object> get props => [currentUser];
}

class UpdateCurrentUserStateError extends UpdateCurrentUserState {}

// class UpdateProfilePictureInitial extends UpdateProfilePictureState {}

// class UpdateProfilePictureLoading extends UpdateProfilePictureState {}

// class UpdateProfilePictureSuccess extends UpdateProfilePictureState {
//   UpdateProfilePictureSuccess(this.currentUser);

//   final CurrentUser currentUser;

//   @override
//   List<Object> get props => [currentUser];
// }

// class UpdateProfilePictureError extends UpdateProfilePictureState {}

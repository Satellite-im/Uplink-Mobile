part of 'update_current_user_bloc.dart';

@immutable
abstract class UpdateCurrentUserState extends Equatable {
  @override
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
